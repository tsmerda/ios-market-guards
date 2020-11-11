//
//  SkillsView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 24/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct SkillsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = SkillsViewModel()
    
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        ZStack {
            Color("negative")
                .edgesIgnoringSafeArea(.bottom)
            List {
                ForEach(viewModel.skills ?? []) { skill in
                    if self.viewModel.isAllowedSkill(code: skill.code) {
                        NavigationLink(destination: SubSkillsView(skillId: skill.id)
                                        .navigationBarTitle(Text(skill.title), displayMode: .inline)) {
                            SkillItemView(skill: skill)
                        }
                    }
                }.listRowBackground(Color("negative"))
            }
            .padding(.top)
        }
        .navigationBarTitle(Text("skills"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(Color("mainExtraLight"))
        })
    }
}

struct SkillsView_Previews: PreviewProvider {
    static var previews: some View {
        SkillsView()
    }
}
