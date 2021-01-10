//
//  QuestDetailView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 10/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct QuestDetailView: View {
    @StateObject var viewModel = QuestDetailViewModel()
    @State var topIndex = 0
    @State var questId: Int
    @State private var textFieldValue: String = ""
    @State private var noteSaved: Bool = false
    @State private var noteColor: Bool = false // TODO
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(self.viewModel.questDetail?.title.uppercased() ?? "")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.chakraPetchRegular(size: 26))
                            .foregroundColor(Color(ColorsConstants.mainExtraLight))
                            .padding(.bottom, 12)
                        
                        Text(viewModel.questDetail?.missionTitle ?? "")
                            .font(.chakraPetchRegular(size: 13))
                            .foregroundColor(Color(ColorsConstants.mainLight))
                        
                        HStack {
                            Text(viewModel.questType?.timeText ?? "")
                            
                            if viewModel.questType == QuestType.active {
                                Text("\(viewModel.diff.secondsTimeFormating)")
                                    .onReceive(timer) { _ in
                                        if viewModel.diff > 0 {
                                            viewModel.diff -= 1
                                        }
                                    }
                            } else if viewModel.questType == QuestType.finished {
                                Text("\((viewModel.questDetail?.finished ?? "").formatFinishedDate)")
                            }
                            
                        }
                        .font(.chakraPetchRegular(size: 15))
                        .foregroundColor(Color(viewModel.questType?.timeColor ?? ColorsConstants.mainLight))
                        .padding(.bottom, 8)
                        
                        Text(viewModel.questDetail?.story ?? "")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.chakraPetchRegular(size: 15))
                            .foregroundColor(Color(ColorsConstants.main))
                        
                        Text(viewModel.questDetail?.description ?? "")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.chakraPetchBold(size: 15))
                            .foregroundColor(Color(ColorsConstants.main))
                    }
                    Spacer()
                }
                
                if (viewModel.questDetail?.finished == nil) {
                    Button(action: {
                        viewModel.questDetail?.activated == nil ? viewModel.patchActivateQuest(questId: questId) : viewModel.patchFinishQuest(questId: questId)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            viewModel.fetchQuestDetailData(questId: questId)
                        }
                    }) {
                        ButtonWithBackground(text: (viewModel.questDetail?.activated == nil) ? "quests_start_quest" : "quests_finish_quest", color: ColorsConstants.pureBlack ,backgroundColor: ColorsConstants.main)
                            .padding(.top)
                            .frame(width: 200)
                    }
                }
                
                Divider()
                    .background(Color(ColorsConstants.mainExtraLow))
                    .padding(.vertical)
                
                HStack {
                    ForEach(0..<MenuType.questDetail.topMenu.count) { menu in
                        TopMenu(menu: menu, index: $topIndex, menuType: MenuType.questDetail)
                    }
                }
                .padding(.bottom)
                
                HStack {
                    if topIndex == 0 {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("quests_finished_quest_points")
                                .font(.chakraPetchRegular(size: 15))
                                .foregroundColor(Color(ColorsConstants.mainExtraLight))
                            
                            Text("quests_finished_quest_points_subtitle")
                                .font(.chakraPetchRegular(size: 12))
                                .foregroundColor(Color(ColorsConstants.mainLight))
                            
                            HStack {
                                MainSkillPoint(experiences: .constant(viewModel.questDetail?.experiences ?? 0), bonusExperiences: .constant(viewModel.questDetail?.bonusExperiences ?? 0))
                                Text("quests_experiences")
                                    .font(.chakraPetchRegular(size: 12))
                                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
                            }
                            
                            ForEach(viewModel.questDetail?.questSkills ?? []) { skill in
                                ForEach(skill.questSubSkills ?? []) { subskill in
                                    HStack {
                                        SkillPoint(code: skill.code, subSkillCode: subskill.code, experiences: .constant(subskill.experiences ?? 0), bonusExperiences: .constant(subskill.bonusExperiences ?? 0))
                                        
                                        Text(LocalizedStringKey(subskill.code))
                                            .font(.chakraPetchRegular(size: 12))
                                            .foregroundColor(Color(ColorsConstants.mainExtraLight))
                                    }
                                }
                            }
                        }
                    }
                    
                    if topIndex == 1 {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("quests_average_time")
                                .font(.chakraPetchRegular(size: 15))
                                .foregroundColor(Color(ColorsConstants.mainExtraLight))
                            
                            Text("\(viewModel.questDetail?.averageTime ?? 0) / \(viewModel.questDetail?.timeToFinish ?? 0) min")
                                .font(.chakraPetchRegular(size: 15))
                                .foregroundColor(Color(ColorsConstants.mainLight))
                            
                            ProgressBar(value: .constant(CGFloat(viewModel.questDetail?.averageTime ?? 0)), maxValue: .constant(CGFloat(viewModel.questDetail?.timeToFinish ?? 0)),
                                        color: ColorsConstants.main)
                                .padding(.bottom, 16)
                            
                            Text("quests_my_time")
                                .font(.chakraPetchRegular(size: 15))
                                .foregroundColor(Color(ColorsConstants.mainExtraLight))
                            
                            Text("\(QuestType.finished.getFinishedTime(activated: viewModel.questDetail?.activated, finished: viewModel.questDetail?.finished)) / \(viewModel.questDetail?.timeToFinish ?? 0) min")
                                .font(.chakraPetchRegular(size: 15))
                                .foregroundColor(viewModel.questType == .unfinished ? Color(ColorsConstants.errorLight) : Color(ColorsConstants.mainLight))
                            
                            ProgressBar(value: .constant(CGFloat(QuestType.finished.getFinishedTime(activated: viewModel.questDetail?.activated, finished: viewModel.questDetail?.finished))), maxValue: .constant(CGFloat(viewModel.questDetail?.timeToFinish ?? 0)),
                                        color: ColorsConstants.main)
                        }
                    }
                    
                    if topIndex == 2 {
                        VStack(alignment: .leading, spacing: 4) {
                            TextField("quests_notes_placeholder", text: Binding(
                                        get: {
                                            return viewModel.questDetail?.note ?? textFieldValue
                                        },
                                        set: { newValue in
                                            return textFieldValue = newValue
                                        }), onEditingChanged: { (changed) in
                                            if changed == true {
                                                noteSaved = false
                                            } else {
                                                noteSaved = true
                                                viewModel.patchQuestDetail(id: questId, note: textFieldValue)
                                            }
                                        })
                                .padding(8)
                                .font(.chakraPetchRegular(size: 13))
                                .foregroundColor(Color(ColorsConstants.mainExtraLight))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color(ColorsConstants.mainLow), lineWidth: 1)
                                )
                                .frame(maxWidth: .infinity)
                            
                            if noteSaved == true {
                                HStack {
                                    Image("ok")
                                        .foregroundColor(Color(ColorsConstants.success))
                                    
                                    Text("quests_notes_saved")
                                        .font(.chakraPetchRegular(size: 13))
                                        .foregroundColor(Color(ColorsConstants.success))
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }
            .padding(16)
        }
        .onAppear() {
            viewModel.fetchQuestDetailData(questId: questId)
        }
        .background(
            ZStack {
                Color(ColorsConstants.negative)
            }
            .edgesIgnoringSafeArea(.vertical)
        )
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

//struct QuestDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestDetailView()
//    }
//}
