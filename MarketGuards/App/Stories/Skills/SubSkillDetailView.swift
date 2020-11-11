//
//  SubSkillDetailView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 25/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct SubSkillDetailView: View {
    @ObservedObject var viewModel = SubSkillDetailViewModel()
    @Binding var isSubSkillDetailPresented: Bool
    @State var skillId: Int
    @State var subSkillId: Int
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("\(viewModel.subSkillDetail?.subSkillType.description ?? "")")
                        .font(.chakraPetchRegular(size: 14))
                        .foregroundColor(Color("mainExtraLight"))
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .background(Color("negative"))
            .navigationBarTitle(Text(viewModel.subSkillDetail?.subSkillType.title ?? ""), displayMode: .inline)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(trailing: Button(action: {
                isSubSkillDetailPresented.toggle()
            }) {
                Text("close")
                    .font(.chakraPetchMedium(size: 14))
                    .foregroundColor(Color("mainExtraLight"))
            })
            .onAppear() {
                viewModel.fetchSubSkillDetail(skillId: skillId, subSkillId: subSkillId)
            }
        }
    }
}

//struct SubSkillDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubSkillDetailView()
//    }
//}
