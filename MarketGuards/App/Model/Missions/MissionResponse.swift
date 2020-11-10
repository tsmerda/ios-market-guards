//
//  MissionResponse.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 28/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

// MARK: - Missions preview

struct MissionsPreviewResponse: Codable, Identifiable, Hashable {
    let id: Int?
    let missionType: MissionType
    let title: String
    let dateCreated: String?
    let dateFinished: String?
    let finishedQuests: Int?
    let totalQuests: Int?
    let finishedOptionalQuests: Int?
    let totalOptionalQuests: Int?
    let questsSeen: Bool?
    let firstSeen: Bool?
}

struct MissionType: Codable, Identifiable, Hashable {
    let id: Int?
    let code: String?
}

// MARK: - Missions detail

struct MissionDetailResponse: Codable, Identifiable, Hashable {
    let id: Int?
    let missionType: MissionType?
    let titleImage: String?
    let title: String?
    let story: String?
    let storyFinish: String?
    let firstSeen: Bool?
    let activeQuests: [MissionDetailQuestsResponse]
    let preparedQuests: [MissionDetailQuestsResponse]
    let finishedQuests: [MissionDetailQuestsResponse]
}

struct MissionDetailQuestsResponse: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let missionTitle: String
    let story: String
    let created: String
    let currency: Int?
    let activated: String?
    let finished: String?
    let timeToActive: Int?
    let timeToFinish: Int
    let experiences: Int?
    let bonusExperiences: Int?
    let difficultyEvaluation: Int?
    let questSkillDtos: [MissionDetailSkillCategoryResponse]
    let seen: Bool
}

struct MissionDetailSkillCategoryResponse: Codable, Identifiable, Hashable {
    let id: Int
    let code: String
    let experiences: Int?
    let bonusExperiences: Int?
    let questSubSkills: [MissionDetailSkillCategoryResponse]?
}
