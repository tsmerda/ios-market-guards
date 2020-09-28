//
//  CurrentUserManager.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 27/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

class CurrentUserManager {
    private(set) var accessToken: String?
    var refreshToken: String?
    
    static let shared = CurrentUserManager()
    
    private init() { }
    
    func setAccessToken(_ token: String) {
        self.accessToken = token.replacingOccurrences(of: "Bearer ", with: "")
    }
}
