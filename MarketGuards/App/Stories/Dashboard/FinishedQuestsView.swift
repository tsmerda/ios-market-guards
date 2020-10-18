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
                .font(.system(size: 14))
                .foregroundColor(Color("disabled"))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom)
                .padding(.horizontal)
        } else {
            ForEach(missionDetail?.finishedQuests ?? []) { quest in
                NavigationLink(destination: QuestDetailView(questId: quest.id, type: .finished(date: quest.finished!))) {
                    QuestRow(quest: quest, type: .finished(date: quest.finished!))
                        .padding(.bottom)
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
