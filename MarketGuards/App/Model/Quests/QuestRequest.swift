//
//  QuestRequest.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 10/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

struct QuestRequest: Encodable {
    let questId: Int
    let action: String
    
    init(questId: Int, action: String) {
        self.questId = questId
        self.action = action
    }
}
