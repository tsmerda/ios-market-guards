//
//  AuthTarget.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 27/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Moya

enum AuthTarget: TargetType {
    
    case login(LoginRequest)
    
    var baseURL: URL {
        return Shared.shared.baseUrl.appendingPathComponent("security")
    }
    
    var path: String {
        switch self {
        case .login:
            return "login"
        }
    }
    
    var method: Method {
        switch self {
        case .login:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .login(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
