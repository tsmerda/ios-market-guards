//
//  StoryResponse.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 08.12.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

struct Tag: Identifiable {
    var id = UUID()
    var title: String
}

struct StoryItem: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var author: String
    var date: String
    var place: String
    var read: Int
    var tags: [Tag]
}
