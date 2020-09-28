//
//  LoginRequest.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 27/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

struct LoginRequest: Encodable {
    let login: String
    let password: String
    
    init(login: String, password: String) {
        self.login = login
        self.password = password.sha256
    }
}
