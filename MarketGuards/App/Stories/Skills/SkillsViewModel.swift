//
//  SkillsViewModel.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 24/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

class SkillsViewModel: ObservableObject {
    @Published var skills: [SkillsResponse]?
    @Published var skillDetail: SkillDetail?
    @Published var subSkillDetail: SubSkillDetail?
    private let skillsService = SkillsService()
    
    init() {
        fetchSkills()
    }
    
    func fetchSkills() {
        skillsService.fetchSkills { [weak self] result in
            switch result {
            case .success(let response):
                self?.skills = response
//                print(response)
            case .failure(let error):
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchSkillDetail(skillId: Int) {
        skillsService.fetchSkillDetail(skillId: skillId) { [weak self] result in
            switch result {
            case .success(let response):
                self?.skillDetail = response
//                print(response)
            case .failure(let error):
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchSubSkillDetail(skillId: Int, subSkillId: Int) {
        skillsService.fetchSubSkillDetail(skillId: skillId, subSkillId: subSkillId) { [weak self] result in
            switch result {
            case .success(let response):
                self?.subSkillDetail = response
//                print(response)
            case .failure(let error):
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    func isAllowedSkill(code: String) -> Bool {
        return code == "selfDevelopment" || code == "leadership" || code == "management" || code == "others" ? false : true
    }
    
}
