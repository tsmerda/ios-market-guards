//
//  BestPracticeResponse.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 08.12.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

struct BestPracticeTag: Identifiable {
    var id = UUID()
    var title: String
    var bestPracticeItem: [BestPracticeItem]
}

struct BestPracticeItem: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var difficulty: String
}
