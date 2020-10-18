//
//  QuestRow.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 30/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

enum QuestType {
    case prepared(minutes: Int)
    case active(minutes: Int)
    case finished(date: String)
    
    var time: LocalizedStringKey {
        switch self {
        case .prepared(let minutes):
            return "Čas na splnění: \(minutes.minutesToRemainingTime)"
        case .active(let request):
            return "quests_remaining_time \(request)" // Add timer function
        case .finished(let date):
            return "Splněno: \(date)"
        }
    }
    
    var timeIcon: String {
        switch self {
        case .prepared:
            return "time"
        case .active:
            return "remaining_time"
        case .finished:
            return "ok"
        }
    }
    
    var timeColor: String {
        switch self {
        case .prepared:
            return "mainLight"
        case .active:
            return "warningLight"
        case .finished:
            return "successLight"
        }
    }
    
    var buttonText: LocalizedStringKey {
        switch self {
        case .prepared:
            return "quests_start_quest"
        case .active:
            return "quests_finish_quest"
        case .finished:
            return ""
        }
    }
    
    var buttonAction: String {
        switch self {
        case .prepared:
            return "activate"
        case .active:
            return "finish"
        case .finished:
            return ""
        }
    }
}

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
