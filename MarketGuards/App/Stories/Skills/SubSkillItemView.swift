//
//  SubSkillItemView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 24/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct SubSkillItemView: View {
    @State var subSkill: SubSkills?
    @State var skillType: SkillType?
    
    var body: some View {
        VStack {
            HStack {
                Image(subSkill?.code ?? "")
                    .resizable()
                    .frame(width: 68, height: 68)
                    .foregroundColor(Color("\(subSkill?.code ?? "")"))
                    .border(Color("\(skillType?.code ?? "")Low"), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text((subSkill?.title ?? "").uppercased())
                        .font(.chakraPetchRegular(size: 18))
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                    HStack {
                        HStack {
                            Text("skills_level")
                            Text("\(subSkill?.level ?? 0)")
                        }
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                        
                        Text("|")
                            .foregroundColor(Color(ColorsConstants.mainExtraLight))
                        
                        Text("\(subSkill?.experiences ?? 0) / \(subSkill?.experiencesToNextLevel ?? 0)")
                            .foregroundColor(Color(ColorsConstants.mainExtraLight))
                    }
                    .font(.chakraPetchRegular(size: 16))
                    
                    ProgressBar(value: .constant(CGFloat(subSkill?.experiences ?? 0)),
                                maxValue: .constant(CGFloat(subSkill?.experiencesToNextLevel ?? 0)),
                                color: skillType?.code ?? ColorsConstants.main)
                }
            }
            .padding(.vertical, 8)
            
            Divider()
                .background(Color(ColorsConstants.mainExtraLow))
        }
    }
}

//struct SubSkillItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubSkillItemView()
//    }
//}
