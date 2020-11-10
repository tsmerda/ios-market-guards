//
//  QuestsTarget.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 10/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Moya

enum QuestsTarget: TargetType, AccessTokenAuthorizable {
    
    case questPatch(QuestRequest)
    case questDetail(Int)
    case questActivate(Int)
    case questFinish(Int)
    
    var baseURL: URL {
        return Shared.shared.baseUrl.appendingPathComponent("quests")
    }
    
    var path: String {
        switch self {
        case .questPatch(let request):
            return "\(request.id)"
        case .questDetail(let request):
            return "\(request)"
        case .questActivate(let request):
            return "\(request)/activate"
        case .questFinish(let request):
            return "\(request)/finish"
        }
    }
    
    var method: Method {
        switch self {
        case .questPatch, .questFinish, .questActivate:
            return .patch
        case .questDetail:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .questPatch, .questDetail, .questFinish, .questActivate:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .questDetail, .questFinish, .questActivate:
            return .requestPlain
        case .questPatch(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .questPatch, .questDetail, .questFinish, .questActivate:
            return ["Content-Type": "application/json"]
        }
    }
    
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}
