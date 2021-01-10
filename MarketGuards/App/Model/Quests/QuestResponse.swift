//
//  QuestResponse.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 10/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

// MARK: - QuestDetail
struct QuestDetailResponse: Codable, Identifiable, Hashable {
    let id: Int
    let code: String
    let title: String
    let missionTitle: String
    let story: String
    let storyFinish: String?
    let description: String?
    let created: String?
    let activated: String?
    let finished: String?
    let timeToFinish: Int?
    let currency: Int?
    let experiences: Int?
    let bonusExperiences: Int?
    let averageTime: Int?
    let note: String?
    let difficultyEvaluation: Int?
    let completingType: CompletingType
    let questSkills: [MissionDetailSkillCategoryResponse]?
    let seen: Bool
}

struct CompletingType: Codable, Identifiable, Hashable {
    let id: Int?
    let code: String?
    let title: String?
}
