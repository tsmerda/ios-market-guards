//
//  SkillsView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 24/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct SkillsView: View {
    @StateObject var viewModel = SkillsViewModel()
    
    var body: some View {
        ZStack {
            Color(ColorsConstants.negative)
                .edgesIgnoringSafeArea(.bottom)
            ScrollView {
                ForEach(viewModel.skills ?? []) { skill in
                    if self.viewModel.isAllowedSkill(code: skill.code) {
                        NavigationLink(destination: SubSkillsView(viewModel: SkillsViewModel(service: SkillsService(), skillId: skill.id, subSkillId: viewModel.subSkillId))
                                        .navigationBarTitle(Text(skill.title), displayMode: .inline)) {
                            SkillItemView(skill: skill)
                        }
                        .disabled(viewModel.isDisabledSkill(skill.experiences))
                    }
                }
            }
            .padding(.vertical)
            
            Spacer()
        }
        .navigationBarTitle(Text("skills"), displayMode: .inline)
        .onAppear {
            viewModel.fetchSkills()
        }
    }
}

//struct SkillsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SkillsView()
//    }
//}
