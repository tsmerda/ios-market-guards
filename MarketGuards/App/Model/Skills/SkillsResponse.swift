//
//  SkillsResponse.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

// MARK: - Skills preview

struct SkillsResponse: Codable, Identifiable, Hashable {
    let id: Int
    let level: Int
    let experiences: Int
    let experiencesToNextLevel: Int
    let code: String
    let title: String
    let subSkills: [SubSkillsId]
}

struct SubSkillsId: Codable, Identifiable, Hashable {
    let id: Int
}

// MARK: - Skill detail

struct SkillDetail: Codable, Identifiable, Hashable {
    let id: Int
    let skillType: SkillType
    let subSkills: [SubSkills]
}

struct SkillType: Codable, Identifiable, Hashable {
    let id: Int
    let code: String
    let title: String
    let description: String
}

struct SubSkills: Codable, Identifiable, Hashable {
    let id: Int
    let level: Int
    let experiences: Int
    let experiencesToNextLevel: Int
    let code: String
    let title: String
}

// MARK: - SubSkill detail

struct SubSkillDetail: Codable, Identifiable, Hashable {
    let id: Int
    let subSkillType: SkillType
}
