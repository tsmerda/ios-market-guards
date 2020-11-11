//
//  SettingsTarget.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 01/11/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Moya

enum SettingsTarget: TargetType, AccessTokenAuthorizable {
    
    case createInvitation(CreateInvitationRequest)
    case changePassword(ChangePasswordRequest)
    
    var baseURL: URL {
        return Shared.shared.baseUrl.appendingPathComponent("security")
    }
    
    var path: String {
        switch self {
        case .createInvitation:
            return "invitation"
        case .changePassword:
            return "password/change"
        }
    }
    
    var method: Method {
        switch self {
        case .createInvitation:
            return .post
        case .changePassword:
            return .patch
        }
    }
    
    var sampleData: Data {
        switch self {
        case .createInvitation, .changePassword:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .createInvitation(let request):
            return .requestJSONEncodable(request)
        case .changePassword(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .createInvitation, .changePassword:
            return ["Content-Type": "application/json"]
        }
    }
    
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}
