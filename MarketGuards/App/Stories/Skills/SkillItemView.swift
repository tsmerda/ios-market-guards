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
        HStack {
            Image(skill?.code ?? "")
                .resizable()
                .frame(width: 68, height: 68)
                .foregroundColor(Color("\(skill?.code ?? "")"))
                .border(Color("\(skill?.code ?? "")Low"), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .leading) {
                Text((skill?.title ?? "").uppercased())
                    .font(.chakraPetchRegular(size: 18))
                    .foregroundColor(Color("mainExtraLight"))
                HStack {
                    HStack {
                        Text("skills_level")
                        Text("\(skill?.level ?? 0)")
                    }
                    .foregroundColor(Color("mainExtraLight"))
                    
                    Text("|")
                        .foregroundColor(Color("mainExtraLight"))
                    
                    Text("\(skill?.experiences ?? 0) / \(skill?.experiencesToNextLevel ?? 0)")
                        .foregroundColor(Color("mainExtraLight"))
                }
                .font(.chakraPetchRegular(size: 16))
                
                ProgressBar(value: .constant(CGFloat(skill?.experiences ?? 0)),
                            maxValue: .constant(CGFloat(skill?.experiencesToNextLevel ?? 0)),
                            color: skill?.code ?? "main")
            }
        }
        .padding(.vertical, 8)
        .padding(.trailing)
    }
}

//struct SkillItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        SkillItemView()
//    }
//}
