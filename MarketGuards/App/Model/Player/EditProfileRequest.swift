//
//  EditProfileRequest.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 02/11/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

struct EditProfileRequest: Encodable {
    let avatar: String
    let nickname: String
    
    init(avatar: String, nickname: String) {
        self.avatar = avatar
        self.nickname = nickname
    }
}
