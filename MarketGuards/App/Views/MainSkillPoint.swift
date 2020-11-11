//
//  MainSkillPoint.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 04/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct MainSkillPoint: View {
    @State var experiences: Int?
    @State var bonusExperiences: Int?
    
    var body: some View {
        HStack(spacing: 4) {
            Image("experiences")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(Color("main"))
            
            HStack(spacing: 0) {
                Text("\(experiences ?? 0)")
                    .font(.chakraPetchBold(size: 15))
                    .foregroundColor(Color("main"))
                
                if (bonusExperiences != 0) {
                    Text(" +\(bonusExperiences ?? 0)")
                        .font(.chakraPetchBold(size: 15))
                        .foregroundColor(Color("warning"))
                }
            }
        }
        .frame(width: 104, height: 32, alignment: .center)
        .background(Color("mainLow"))
    }
}

struct MainSkillPoint_Previews: PreviewProvider {
    static var previews: some View {
        MainSkillPoint(experiences: 10, bonusExperiences: 5)
    }
}
