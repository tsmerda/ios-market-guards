//
//  MissionRequest.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 28/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

struct MissionRequest: Encodable {
    let missionId: Int
    
    init(missionId: Int) {
        self.missionId = missionId
    }
}
