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
    @State var viewModel = QuestDetailViewModel()
    @State var questId: Int
    @State private var textFieldValue: String = ""
    @State var type: QuestType
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                VStack(alignment: .leading) {
                    Text(self.viewModel.questDetail?.title.uppercased() ?? "")
                        .font(.system(size: 32))
                        .foregroundColor(Color("mainExtraLight"))
                    
                    Text(viewModel.questDetail?.missionTitle ?? "")
                        .font(.system(size: 12))
                        .foregroundColor(Color("mainLight"))
                        .padding(.bottom, 4)
                    
                    Text(type.time)
                        .font(.system(size: 16))
                        .foregroundColor(Color("warning"))
                        .padding(.bottom, 4)
                    
                    Text(viewModel.questDetail?.story ?? "")
                        .font(.system(size: 16))
                        .foregroundColor(Color("main"))
                        .padding(.bottom, 8)
                }
                
                if (type.buttonAction == "activate") || (type.buttonAction == "finish") {
                    Button(action: {
                        viewModel.patchQuestDetail(questId: questId, action: type.buttonAction)
                        viewModel.fetchQuestDetailData(questId: questId) //fix !!!
                        
                    }) {
                        ButtonWithBackground(text: type.buttonText, color: "pureBlack" ,backgroundColor: "main")
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
                        VStack(alignment: .leading, spacing: 8) {
                            Text("quests_skills")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Color("mainExtraLight"))
                                .padding(.bottom, 8)
                            
                            Text("quests_finished_quest_points")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color("mainExtraLight"))
                                .padding(.bottom, 4)
                            
                            Text("quests_finished_quest_points_subtitle")
                                .font(.system(size: 12))
                                .foregroundColor(Color("mainLight"))
                            
                            HStack {
                                MainSkillPoint(experiences: viewModel.questDetail?.experiences, bonusExperiences: viewModel.questDetail?.bonusExperiences)
                                Text("quests_experiences")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color("mainExtraLight"))
                            }
                            
                            ForEach(viewModel.questDetail?.questSkills ?? []) { skill in
                                ForEach(skill.questSubSkills ?? []) { subskill in
                                    HStack {
                                        SkillPoint(code: skill.code, experiences: subskill.experiences, bonusExperiences: subskill.bonusExperiences)
                                        
                                        Text("subskills_\(subskill.code)")
                                            .font(.system(size: 12))
                                            .foregroundColor(Color("mainExtraLight"))
                                    }
                                }
                            }
                        }
                    }
                    
                    if topIndex == 1 {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("quests_statistics")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Color("mainExtraLight"))
                                .padding(.bottom, 8)
                            
                            Text("quests_average_time")
                                .font(.system(size: 14))
                                .foregroundColor(Color("mainExtraLight"))
                            
                            Text("\(viewModel.questDetail?.averageTime ?? 0) / \(viewModel.questDetail?.timeToFinish ?? 0)")
                                .font(.system(size: 14))
                                .foregroundColor(Color("mainLight"))
                            
                            ProgressBar(value: .constant(CGFloat(viewModel.questDetail?.averageTime ?? 0)), maxValue: .constant(CGFloat(viewModel.questDetail?.timeToFinish ?? 0)),
                                        color: "main")
                        }
                    }
                    
                    if topIndex == 2 {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("quests_notes")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Color("mainExtraLight"))
                                .padding(.bottom, 8)
                            
                            TextField("quests_notes_placeholder", text: $textFieldValue)
                                .padding(8)
                                .font(.system(size: 16))
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
        .onAppear() { viewModel.fetchQuestDetailData(questId: questId)} // fix !!!
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
