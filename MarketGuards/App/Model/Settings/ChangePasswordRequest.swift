//
//  ChangePasswordRequest.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 02/11/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

struct ChangePasswordRequest: Encodable {
    let idPlayer: String
    let oldPassword: String
    let newPassword: String
    
    init(idPlayer: String, oldPassword: String, newPassword: String) {
        self.idPlayer = idPlayer
        self.oldPassword = oldPassword
        self.newPassword = newPassword
    }
}
