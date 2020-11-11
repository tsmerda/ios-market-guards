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
    
    func isAllowedSkill(code: String) -> Bool {
        return code == "selfDevelopment" || code == "leadership" || code == "management" || code == "others" ? false : true
    }
    
}
