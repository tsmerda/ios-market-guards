//
//  SubSkillItemView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 24/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

// TODO -- Add function to viewModel -> (subSkill?.experiences ?? 0) != 0)
struct SubSkillItemView: View {
    @State var subSkill: SubSkills?
    @State var skillType: SkillType?
    
    var body: some View {
        VStack {
            HStack {
                Image(((subSkill?.experiences ?? 0) != 0) ? subSkill?.code ?? "" : "disabled")
                    .resizable()
                    .frame(width: 68, height: 68)
                    .foregroundColor(Color(((subSkill?.experiences ?? 0) != 0) ? "\(skillType?.code ?? "")" : ColorsConstants.disabled))
                    .border(Color(((subSkill?.experiences ?? 0) != 0) ? "\(skillType?.code ?? "")Low" : ColorsConstants.disabledLow), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text((subSkill?.title ?? "").uppercased())
                        .font(.chakraPetchRegular(size: 18))
                        .foregroundColor(Color(((subSkill?.experiences ?? 0) != 0) ? ColorsConstants.mainExtraLight : ColorsConstants.disabled))
                    HStack {
                        HStack {
                            Text("skills_level")
                            Text("\(subSkill?.level ?? 0)")
                        }
                        
                        Text("|")
                        
                        Text("\(subSkill?.experiences ?? 0) / \(subSkill?.experiencesToNextLevel ?? 0)")
                    }
                    .font(.chakraPetchRegular(size: 16))
                    .foregroundColor(Color(((subSkill?.experiences ?? 0) != 0) ? ColorsConstants.mainExtraLight : ColorsConstants.disabled))
                    
                    ProgressBar(value: .constant(CGFloat(subSkill?.experiences ?? 0)),
                                maxValue: .constant(CGFloat(subSkill?.experiencesToNextLevel ?? 0)),
                                color: ((subSkill?.experiences ?? 0) != 0) ? skillType?.code ?? ColorsConstants.main : ColorsConstants.disabled)
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
