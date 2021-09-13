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
    @Published var skillId = Int()
    @Published var subSkillId = Int()
    
    private var service = SkillsService()
    
    func fetchSkills() {
        service.fetchSkills { [weak self] result in
            switch result {
            case .success(let response):
                self?.skills = response
//                print(response)
            case .failure(let error):
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchSkillDetail(_ skillId: Int) {
        service.fetchSkillDetail(skillId: skillId) { [weak self] result in
            switch result {
            case .success(let response):
                self?.skillDetail = response
//                print(response)
            case .failure(let error):
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchSubSkillDetail(_ skillId: Int, _ subSkillId: Int) {
        service.fetchSubSkillDetail(skillId: skillId, subSkillId: subSkillId) { [weak self] result in
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
    
    func isDisabledSkill(_ experiences: Int) -> Bool {
        return experiences == 0
    }
    
    convenience init() {
        self.init(service: SkillsService(), skillId: Int(), subSkillId: Int())
    }
    
    init(service: SkillsService, skillId: Int, subSkillId: Int) {
        self.service = service
        self.skillId = skillId
        self.subSkillId = subSkillId
    }
}
