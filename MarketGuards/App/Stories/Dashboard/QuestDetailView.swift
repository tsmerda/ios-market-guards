//
//  QuestDetailView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 10/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct QuestDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var topIndex = 0
    @StateObject var viewModel = QuestDetailViewModel()
    @State var questId: Int
    @State private var textFieldValue: String = ""
    @State var type: QuestType
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(self.viewModel.questDetail?.title.uppercased() ?? "")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(title)
                        .foregroundColor(Color("mainExtraLight"))
                        .padding(.bottom, 12)
                    
                    Text(viewModel.questDetail?.missionTitle ?? "")
                        .font(footnote)
                        .foregroundColor(Color("mainLight"))
                    
                    Text(type.time)
                        .font(subhead)
                        .foregroundColor(Color("warning"))
                    
                    Text(viewModel.questDetail?.story ?? "")
                        .font(subhead)
                        .foregroundColor(Color("main"))
                }
                
                if (viewModel.questDetail?.finished == nil) {
                    Button(action: {
                        viewModel.patchQuestDetail(questId: questId, action: (viewModel.questDetail?.activated == nil) ? "activate" : "finish")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            viewModel.fetchQuestDetailData(questId: questId)
                        }
                    }) {
                        ButtonWithBackground(text: (viewModel.questDetail?.activated == nil) ? "quests_start_quest" : "quests_finish_quest", color: "pureBlack" ,backgroundColor: "main")
                            .padding(.top)
                            .frame(width: 200)
                    }
                }
                
                Divider()
                    .background(Color("mainExtraLightLow"))
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
                            Text("quests_skills")
                                .font(callout).bold()
                                .foregroundColor(Color("mainExtraLight"))
                            
                            Text("quests_finished_quest_points")
                                .font(subhead)
                                .foregroundColor(Color("mainExtraLight"))
                            
                            Text("quests_finished_quest_points_subtitle")
                                .font(caption)
                                .foregroundColor(Color("mainLight"))
                            
                            HStack {
                                MainSkillPoint(experiences: viewModel.questDetail?.experiences, bonusExperiences: viewModel.questDetail?.bonusExperiences)
                                Text("quests_experiences")
                                    .font(caption)
                                    .foregroundColor(Color("mainExtraLight"))
                            }
                            
                            ForEach(viewModel.questDetail?.questSkills ?? []) { skill in
                                ForEach(skill.questSubSkills ?? []) { subskill in
                                    HStack {
                                        SkillPoint(code: skill.code, experiences: subskill.experiences, bonusExperiences: subskill.bonusExperiences)
                                        
                                        Text(LocalizedStringKey(subskill.code))
                                            .font(caption)
                                            .foregroundColor(Color("mainExtraLight"))
                                    }
                                }
                            }
                        }
                    }
                    
                    if topIndex == 1 {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("quests_statistics")
                                .font(callout).bold()
                                .foregroundColor(Color("mainExtraLight"))
                            
                            Text("quests_average_time")
                                .font(subhead)
                                .foregroundColor(Color("mainExtraLight"))
                            
                            Text("\(viewModel.questDetail?.averageTime ?? 0) / \(viewModel.questDetail?.timeToFinish ?? 0)")
                                .font(subhead)
                                .foregroundColor(Color("mainLight"))
                            
                            ProgressBar(value: .constant(CGFloat(viewModel.questDetail?.averageTime ?? 0)), maxValue: .constant(CGFloat(viewModel.questDetail?.timeToFinish ?? 0)),
                                        color: "main")
                        }
                    }
                    
                    if topIndex == 2 {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("quests_notes")
                                .font(callout).bold()
                                .foregroundColor(Color("mainExtraLight"))
                            
                            TextField("quests_notes_placeholder", text: $textFieldValue)
                                .padding(8)
                                .font(footnote)
                                .foregroundColor(Color("mainExtraLightLow"))
                                .frame(maxWidth: .infinity)
                                .border(Color("mainLow"), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
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
                Color("negative")
            }
            .edgesIgnoringSafeArea(.vertical)
        )
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image("arrow_left")
                .foregroundColor(Color("main"))
        })
    }
}

//struct QuestDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestDetailView()
//    }
//}
