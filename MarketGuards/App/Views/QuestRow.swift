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
    @State var diff: Int = 0 // TODO -- Resolve changing QuestType
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("| \(quest.title.uppercased())")
                    .font(.chakraPetchSemiBold(size: 17))
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
                
                Text(quest.story)
                    .lineLimit(1)
                    .font(.chakraPetchRegular(size: 13))
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
                
                VStack(alignment: .leading, spacing: 4) {
                    MainSkillPoint(experiences: .constant(quest.experiences ?? 0), bonusExperiences: .constant(quest.bonusExperiences ?? 0))
                    SkillRow(skillPoints: quest.questSkillDtos)
                }
                
                HStack(spacing: 2) {
                    Image(type.timeIcon)
                    
                    Text(type.timeText)
                    
                    if type == .active {
                        Text("\(diff.secondsTimeFormating)")
                            .onReceive(timer) { _ in
                                if diff > 0 {
                                    diff -= 1
                                }
                            }
                    } else if type == .finished {
                        Text("\((quest.finished ?? "").formatFinishedDate)")
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
        .background(Color(ColorsConstants.disabledLow))
        .cornerRadius(8)
    }
    
    func getFormatedTime() {
        diff = QuestType.active.getRemainingTime(activated: quest.activated ?? "", finished: quest.timeToFinish)
        if type == .active && diff < 0 {
            type = .unfinished
        }
    }
}

//struct QuestRow_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestRow()
//    }
//}
