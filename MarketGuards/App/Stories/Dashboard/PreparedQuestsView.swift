//
//  PreparedQuestsView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 04/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct PreparedQuestsView: View {
    @Binding var missionDetail: MissionDetailResponse?
    
    var body: some View {
        if missionDetail?.preparedQuests.isEmpty ?? true {
            Text("missions_no_prepared_quests")
                .font(.chakraPetchRegular(size: 13))
                .foregroundColor(Color("disabled"))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom)
                .padding(.horizontal)
        } else {
            ForEach(missionDetail?.preparedQuests ?? []) { quest in
                NavigationLink(destination: QuestDetailView(questId: quest.id)) {
                    QuestRow(quest: quest, type: .prepared)
                        .padding(.bottom, 8)
                }
            }
        }
    }
}

//struct PreparedQuestsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreparedQuestsView()
//    }
//}
