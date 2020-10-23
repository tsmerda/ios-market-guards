//
//  QuestRow.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 30/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct QuestRow: View {
    @State var quest: MissionDetailQuestsResponse
    @State var type: QuestType
    @State var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("| \(quest.title.uppercased())")
                    .font(.system(size: 20))
                    .foregroundColor(Color("mainExtraLight"))
                    .padding(.bottom, 8)
                
                Text(quest.story)
                    .lineLimit(1)
                    .font(.system(size: 14))
                    .foregroundColor(Color("mainExtraLight"))
                
                // TODO - resolve rsponsiveness for multiple skillpoints.
                VStack(alignment: .leading, spacing: 8) {
                    MainSkillPoint(experiences: quest.experiences, bonusExperiences: quest.bonusExperiences ?? 0)
                    HStack(spacing: 8) {
                        ForEach(quest.questSkillDtos) { skill in
                            SkillPoint(code: skill.code, experiences: skill.experiences, bonusExperiences: skill.bonusExperiences)
                        }
                    }
                }.padding(.vertical, 4)
                
                HStack(spacing: 4) {
                    Image(type.timeIcon)
                    
                    Text(type.time)
                        .font(.system(size: 12))
                        .multilineTextAlignment(.trailing)
                }
                .foregroundColor(Color(type.timeColor))
            }
            .padding()
            
            Spacer()
        }
        .background(Color("mainExtraLightExtraLow"))
        .cornerRadius(8)
    }
}

//struct QuestRow_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestRow()
//    }
//}
