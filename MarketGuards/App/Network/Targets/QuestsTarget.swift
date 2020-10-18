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
    case questDetail(QuestRequest)
    
    var baseURL: URL {
        return Shared.shared.baseUrl.appendingPathComponent("quests")
    }
    
    var path: String {
        switch self {
        case .questPatch(let request):
            return "\(request.questId)/\(request.action)"
        case .questDetail(let request):
            return "\(request.questId)"
        }
    }
    
    var method: Method {
        switch self {
        case .questPatch:
            return .patch
        case .questDetail:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .questPatch, .questDetail:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .questPatch, .questDetail:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .questPatch, .questDetail:
            return ["Content-Type": "application/json"]
        }
    }
    
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}
