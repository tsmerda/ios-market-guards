//
//  SkillRequest.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 25/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

struct SubSkillRequest: Encodable {
    let skillId: Int
    let subSkillId: Int
    
    init(skillId: Int, subSkillId: Int) {
        self.skillId = skillId
        self.subSkillId = subSkillId
    }
}
