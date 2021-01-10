//
//  DictionaryResponse.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 08.12.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

struct DictionaryItem: Identifiable {
    var id = UUID()
    var title: String
    var description: String
}

struct DictionaryLetter: Identifiable {
    var id = UUID()
    var letter: String
    var dictionaryItem: [DictionaryItem]
}
