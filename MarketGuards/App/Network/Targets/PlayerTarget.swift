//
//  PlayerTarget.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Moya

enum PlayerTarget: TargetType, AccessTokenAuthorizable {
    
    case gameStatus
    case editProfile(EditProfileRequest)
    
    var baseURL: URL {
        return Shared.shared.baseUrl.appendingPathComponent("player")
    }
    
    var path: String {
        switch self {
        case .gameStatus:
            return "game-status"
        case .editProfile:
            return "profile"
        }
    }
    
    var method: Method {
        switch self {
        case .gameStatus:
            return .get
        case .editProfile:
            return .patch
        }
    }
    
    var sampleData: Data {
        switch self {
        case .gameStatus, .editProfile:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .gameStatus:
            return .requestPlain
        case .editProfile(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .gameStatus, .editProfile:
              return ["Content-Type": "application/json"]
        }
    }
    
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}
