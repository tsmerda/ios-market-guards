//
//  LoginResponse.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 27/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

struct LoginResponse: Decodable {
    let accessToken: String
    let refreshToken: String
}

struct LoginFailedResponse: Decodable {
    let httpStatus: String
    let message: String
    let errorCode: String
    let timeStamp: String
}
