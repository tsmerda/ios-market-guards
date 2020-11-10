//
//  MissionsTarget.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 28/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Moya

enum MissionsTarget: TargetType, AccessTokenAuthorizable {
    
    case mission
    case missionDetail(MissionRequest)
    
    var baseURL: URL {
        return Shared.shared.baseUrl.appendingPathComponent("missions")
    }
    
    var path: String {
        switch self {
        case .mission:
            return "preview"
        case .missionDetail:
            return "detail"
        }
    }
    
    var method: Method {
        switch self {
        case .mission:
            return .get
        case .missionDetail:
            return .patch
        }
    }
    
    var sampleData: Data {
        switch self {
        case .mission, .missionDetail:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .mission:
            return .requestPlain
        case .missionDetail(let request):
            if request.missionId != 0 {
                return .requestParameters(parameters: ["missionId": request.missionId], encoding: URLEncoding(destination: .queryString))
            } else {
                return .requestPlain
            }
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .mission, .missionDetail:
            return ["Content-Type": "application/json"]
        }
    }
    
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}
