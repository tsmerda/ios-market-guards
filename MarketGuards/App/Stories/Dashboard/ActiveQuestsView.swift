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
                .font(.chakraPetchRegular(size: 13))
                .foregroundColor(Color(ColorsConstants.disabled))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom)
                .padding(.horizontal)
        } else {
            ForEach(missionDetail?.activeQuests ?? []) { quest in
                NavigationLink(destination: QuestDetailView(questId: quest.id)) {
                    QuestRow(quest: quest, type: .active)
                        .padding(.bottom, 8)
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
