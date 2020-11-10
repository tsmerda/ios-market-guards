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
    @State var diff: Int? = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("| \(quest.title.uppercased())")
                    .font(.chakraPetchSemiBold(size: 17))
                    .foregroundColor(Color("mainExtraLight"))
                
                Text(quest.story)
                    .lineLimit(1)
                    .font(.chakraPetchRegular(size: 13))
                    .foregroundColor(Color("mainExtraLight"))
                
                // TODO - resolve rsponsiveness for multiple subskillpoints.
                VStack(alignment: .leading, spacing: 4) {
                    MainSkillPoint(experiences: quest.experiences ?? 0, bonusExperiences: quest.bonusExperiences ?? 0)
                    HStack(spacing: 4) {
                        ForEach(quest.questSkillDtos) { skill in
                            SkillPoint(code: skill.code, experiences: skill.experiences  ?? 0, bonusExperiences: skill.bonusExperiences ?? 0)
                        }
                    }
                }
                
                HStack(spacing: 2) {
                    Image(type.timeIcon)
                    
                    Text(type.timeText)
                    
                    if type == .active {
                        Text("\((diff ?? 0).secondsTimeFormating)")
                            .onReceive(timer) { _ in
                                if diff ?? 0 > 0 {
                                    diff? -= 1
                                }
                            }
                    } else {
                        Text(type == .prepared ? "\(quest.timeToFinish.minutesTimeFormating)" : "\(quest.finished ?? "")")
                    }
                }
                .font(.chakraPetchSemiBold(size: 12))
                .foregroundColor(Color(type.timeColor))
                .multilineTextAlignment(.trailing)
            }
            .padding()
            
            Spacer()
        }
        .onAppear() {
            getFormatedTime()
        }
        .background(Color("disabledLow"))
        .cornerRadius(8)
    }
    
    func getFormatedTime() {
        diff = QuestType.active.getDateDifference(activated: quest.activated ?? "", finished: quest.timeToFinish)
    }
}

//struct QuestRow_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestRow()
//    }
//}