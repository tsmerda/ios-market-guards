//
//  StoreResponse.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 08.12.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

struct StoreItem: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var price: Int
    var bought: Int
}
