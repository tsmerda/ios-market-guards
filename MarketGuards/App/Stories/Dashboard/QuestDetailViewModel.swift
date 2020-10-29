//
//  QuestDetailViewModel.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 10/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

class QuestDetailViewModel: ObservableObject {
    @Published var questDetail: QuestDetailResponse?
    
    private var service = QuestsService()
    
    func fetchQuestDetailData(questId: Int) {
        service.fetchQuestDetail(questId: questId) { [weak self] result in
            switch result {
            case .success(let response):
                self?.questDetail = response
            case .failure(let error):
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    func patchQuestDetail(questId: Int, action: String) {
        service.patchQuestDetail(questId: questId, action: action) { [weak self] result in
            switch result {
            case .success:
                break
            case .failure(let error):
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    convenience init() {
        self.init(service: QuestsService())
    }
    
    init(service: QuestsService) {
        self.service = service
    }
}
