//
//  SkillItemView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

// TODO -- Add function to viewModel -> (subSkill?.experiences ?? 0) != 0)
struct SkillItemView: View {
    @State var skill: SkillsResponse?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(((skill?.experiences ?? 0) != 0) ? skill?.code ?? "" : "disabled")
                    .resizable()
                    .frame(width: 68, height: 68)
                    .foregroundColor(Color(((skill?.experiences ?? 0) != 0) ? "\(skill?.code ?? "")" : ColorsConstants.disabled))
                    .border(Color(((skill?.experiences ?? 0) != 0) ? "\(skill?.code ?? "")Low" : ColorsConstants.disabledLow), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text((skill?.title ?? "").uppercased())
                        .font(.chakraPetchRegular(size: 18))
                        .foregroundColor(Color(((skill?.experiences ?? 0) != 0) ? ColorsConstants.mainExtraLight : ColorsConstants.disabled))
                    HStack {
                        HStack {
                            Text("skills_level")
                            Text("\(skill?.level ?? 0)")
                        }
                        
                        Text("|")
                        
                        Text("\(skill?.experiences ?? 0) / \(skill?.experiencesToNextLevel ?? 0)")
                    }
                    .font(.chakraPetchRegular(size: 16))
                    .foregroundColor(Color(((skill?.experiences ?? 0) != 0) ? ColorsConstants.mainExtraLight : ColorsConstants.disabled))
                    
                    ProgressBar(value: .constant(CGFloat(skill?.experiences ?? 0)),
                                maxValue: .constant(CGFloat(skill?.experiencesToNextLevel ?? 0)),
                                color: ((skill?.experiences ?? 0) != 0) ? skill?.code ?? ColorsConstants.main : ColorsConstants.disabled)
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
