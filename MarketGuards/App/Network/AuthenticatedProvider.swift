//
//  AuthenticatedProvider.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 27/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation
import Moya

class AuthenticatedProvider<T: TargetType> {
    static func buildProvider() -> MoyaProvider<T> {
        let authPlugin = AccessTokenPlugin { _ in CurrentUserManager.shared.accessToken ?? "" }
        return MoyaProvider<T>(plugins: [authPlugin])
    }
}
