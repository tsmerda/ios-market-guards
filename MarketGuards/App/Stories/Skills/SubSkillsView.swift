//
//  SubSkillsView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 24/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct SubSkillsView: View {
    @StateObject var viewModel = SkillsViewModel()
    
    var body: some View {
        ZStack {
            Color(ColorsConstants.negative)
                .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                Text("\(viewModel.skillDetail?.skillType.description ?? "")")
                    .font(.chakraPetchRegular(size: 14))
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
                
                ScrollView {
                    ForEach(viewModel.skillDetail?.subSkills ?? []) { subSkill in
                        NavigationLink(destination: SubSkillDetailView(viewModel: SkillsViewModel(service: SkillsService(), skillId: viewModel.skillId, subSkillId: subSkill.id))
                                        .navigationBarTitle(Text(subSkill.title), displayMode: .inline)) {
                            SubSkillItemView(subSkill: subSkill, skillType: viewModel.skillDetail?.skillType)
                        }
                        .disabled(viewModel.isDisabledSkill(subSkill.experiences))
                    }
                }
            }
            .padding()
        }
        .onAppear() {
            viewModel.fetchSkillDetail(viewModel.skillId)
        }
    }
}

//struct SubSkillsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubSkillsView()
//    }
//}
