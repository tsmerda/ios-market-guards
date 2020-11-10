//
//  QuestRequest.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 10/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

struct QuestRequest: Encodable {
    let id: Int
    let note: String
    
    init(id: Int, note: String) {
        self.id = id
        self.note = note
    }
}
