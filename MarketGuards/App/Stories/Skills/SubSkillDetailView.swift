//
//  SubSkillDetailView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 25/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct SubSkillDetailView: View {
    @StateObject var viewModel = SkillsViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text("\(viewModel.subSkillDetail?.subSkillType.description ?? "")")
                    .font(.chakraPetchRegular(size: 14))
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(Color(ColorsConstants.negative))
        .edgesIgnoringSafeArea(.bottom)
        .onAppear() {
            viewModel.fetchSubSkillDetail(viewModel.skillId, viewModel.subSkillId)
        }
        
    }
}

//struct SubSkillDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubSkillDetailView()
//    }
//}
