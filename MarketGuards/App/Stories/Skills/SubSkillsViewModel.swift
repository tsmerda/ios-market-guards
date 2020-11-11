//
//  SubSkillsViewModel.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 24/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

class SubSkillsViewModel: ObservableObject {
    @Published var skillDetail: SkillDetail?
    private let skillsService = SkillsService()
    
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
}
