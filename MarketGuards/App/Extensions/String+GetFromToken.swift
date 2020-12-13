//
//  String+GetFromToken.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 01/11/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation
import JWTDecode

//extension String {
//    var getFromToken: String {
//        do {
//            let jwt = try decode(jwt: CurrentUserManager.shared.accessToken ?? "")
//            return jwt.claim(name: self).string ?? ""
//        } catch {
//            return ""
//        }
//    }
//}

class TokenManager {    
    static let shared = TokenManager()
    
    private init() { }
    
    func getFromToken(_ string: String) -> String {
        do {
            let jwt = try decode(jwt: CurrentUserManager.shared.accessToken ?? "")
            return jwt.claim(name: string).string ?? ""
        } catch {
            return ""
        }
    }
}
