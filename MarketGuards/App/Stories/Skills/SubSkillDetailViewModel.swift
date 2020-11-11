//
//  SubSkillDetailViewModel.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 25/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

class SubSkillDetailViewModel: ObservableObject {
    @Published var subSkillDetail: SubSkillDetail?
    private let skillsService = SkillsService()
    
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
}
