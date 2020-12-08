//
//  SkillsTarget.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Moya

enum SkillsTarget: TargetType, AccessTokenAuthorizable {
    
    case skills
    case skillDetail(Int)
    case subSkillDetail(SubSkillRequest)
    
    var baseURL: URL {
        return Shared.shared.baseUrl.appendingPathComponent("skills")
    }
    
    var path: String {
        switch self {
        case .skills:
            return ""
        case .skillDetail(let request):
            return "\(request)/sub-skills"
        case .subSkillDetail(let request):
            return "\(request.skillId)/sub-skills/\(request.subSkillId)"
        }
    }
    
    var method: Method {
        switch self {
        case .skills, .skillDetail, .subSkillDetail:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .skills, .skillDetail, .subSkillDetail:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .skills, .skillDetail, .subSkillDetail:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .skills, .skillDetail, .subSkillDetail:
            return ["Content-Type": "application/json"]
        }
    }
    
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}
