//
//  ActiveQuestsView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 04/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct ActiveQuestsView: View {
    @Binding var missionDetail: MissionDetailResponse?
    
    var body: some View {
        if missionDetail?.activeQuests.isEmpty ?? true {
            Text("missions_no_active_quests")
                .font(.system(size: 14))
                .foregroundColor(Color("disabled"))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom)
                .padding(.horizontal)
        } else {
            ForEach(missionDetail?.activeQuests ?? []) { quest in
                NavigationLink(destination: QuestDetailView(questId: quest.id, type: .active(minutes: quest.timeToFinish))) {
                    QuestRow(quest: quest, type: .active(minutes: quest.timeToFinish))
                        .padding(.bottom)
                }
            }
        }
        
    }
}

//struct ActiveQuestsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActiveQuestsView()
//    }
//}
