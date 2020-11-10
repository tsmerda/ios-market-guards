//
//  Shared.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 27/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

class Shared {
    static var shared = Shared()
    var baseUrl: URL {
        guard let url = URL(string: "http://37.46.208.113:8080") else { fatalError("No base URL") }
        return url
    }
}

// localhost url: http://localhost:8080
// develop url: http://37.46.208.113:8080
