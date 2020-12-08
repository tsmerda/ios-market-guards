//
//  SkillItemView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct SkillItemView: View {
    @State var skill: SkillsResponse?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(skill?.code ?? "")
                    .resizable()
                    .frame(width: 68, height: 68)
                    .foregroundColor(Color("\(skill?.code ?? "")"))
                    .border(Color("\(skill?.code ?? "")Low"), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text((skill?.title ?? "").uppercased())
                        .font(.chakraPetchRegular(size: 18))
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                    HStack {
                        HStack {
                            Text("skills_level")
                            Text("\(skill?.level ?? 0)")
                        }
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                        
                        Text("|")
                            .foregroundColor(Color(ColorsConstants.mainExtraLight))
                        
                        Text("\(skill?.experiences ?? 0) / \(skill?.experiencesToNextLevel ?? 0)")
                            .foregroundColor(Color(ColorsConstants.mainExtraLight))
                    }
                    .font(.chakraPetchRegular(size: 16))
                    
                    ProgressBar(value: .constant(CGFloat(skill?.experiences ?? 0)),
                                maxValue: .constant(CGFloat(skill?.experiencesToNextLevel ?? 0)),
                                color: skill?.code ?? ColorsConstants.main)
                }
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(ColorsConstants.mainExtraLightLow))
                    .padding()
            }
            
            Divider()
                .background(Color(ColorsConstants.mainExtraLow))
                .padding(.top, 16)
                .padding(.bottom, 8)
        }
        .padding(.leading)
    }
}

//struct SkillItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        SkillItemView()
//    }
//}
