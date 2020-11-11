//
//  SubSkillsView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 24/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct SubSkillsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = SubSkillsViewModel()
    @State private var isSubSkillDetailPresented = false
    @State var skillId: Int
    
    var body: some View {
        ZStack {
            Color("negative")
                .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                Text("\(viewModel.skillDetail?.skillType.description ?? "")")
                    .font(.chakraPetchRegular(size: 14))
                    .foregroundColor(Color("mainExtraLight"))
                
                List {
                    ForEach(viewModel.skillDetail?.subSkills ?? []) { subSkill in
                        Button {
                            isSubSkillDetailPresented.toggle()
                        } label: {
                            SubSkillItemView(subSkill: subSkill, skillType: viewModel.skillDetail?.skillType)
                        }
                        .sheet(isPresented: $isSubSkillDetailPresented, content: { SubSkillDetailView(isSubSkillDetailPresented: $isSubSkillDetailPresented, skillId: skillId, subSkillId: subSkill.id)})
                    }
                    .listRowBackground(Color("negative"))
                }
                .padding(.top)
            }
            .padding()
        }
        .onAppear() {
            viewModel.fetchSkillDetail(skillId: skillId)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(Color("mainExtraLight"))
        })
    }
}

//struct SubSkillsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubSkillsView()
//    }
//}
