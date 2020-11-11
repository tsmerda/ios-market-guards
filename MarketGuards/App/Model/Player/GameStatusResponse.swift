//
//  GameStatusResponse.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

struct GameStatusResponse: Decodable {
    let level: Int
    let currency: Int
    let experiences: Int
    let experiencesRangeFrom: Int
    let experiencesRangeTo: Int
    let analysis: Int
    let contacts: Int
    let addressing: Int
    let consulting: Int
    let services: Int
}
