//
//  SkillPoint.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 04/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct SkillPoint: View {
    @State var code: String?
    @State var experiences: Int?
    @State var bonusExperiences: Int?
    
    var body: some View {
        HStack(spacing: 4) {
            Image(code ?? "")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(Color(code ?? ""))
            
            HStack(spacing: 0) {
                Text("\(experiences ?? 0)")
                    .font(caption).bold()
                    .foregroundColor(Color(code ?? ""))
                
                if (bonusExperiences != 0) {
                    Text(" +\(bonusExperiences ?? 0)")
                        .font(caption).bold()
                        .foregroundColor(Color("warning"))
                }
            }
        }
        .frame(width: 84, height: 24, alignment: .center)
        .background(Color("\(code ?? "")DarkLow"))
    }
}


struct SkillPoint_Previews: PreviewProvider {
    static var previews: some View {
        SkillPoint()
    }
}
