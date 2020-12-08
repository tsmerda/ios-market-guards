//
//  FinishedQuestsView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 04/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct FinishedQuestsView: View {
    @Binding var missionDetail: MissionDetailResponse?
    
    var body: some View {
        if missionDetail?.finishedQuests.isEmpty ?? true {
            Text("missions_no_finished_quests")
                .font(.chakraPetchRegular(size: 13))
                .foregroundColor(Color(ColorsConstants.disabled))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom)
                .padding(.horizontal)
        } else {
            ForEach(missionDetail?.finishedQuests ?? []) { quest in
                NavigationLink(destination: QuestDetailView(questId: quest.id)) {
                    QuestRow(quest: quest, type: .finished)
                        .padding(.bottom, 8)
                }
            }
        }
    }
}

//struct FinishedQuestsView_Previews: PreviewProvider {
//    static var previews: some View {
//        FinishedQuestsView()
//    }
//}
