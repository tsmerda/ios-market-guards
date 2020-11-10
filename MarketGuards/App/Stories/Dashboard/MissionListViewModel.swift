//
//  MissionListViewModel.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 30/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

class MissionListViewModel: ObservableObject {
    @Published var missionsPreview: [MissionsPreviewResponse]?
    
    private var service = MissionsService()
    
    func fetchMissionsPreviewData() {
        service.fetchMissionsPreview { [weak self] result in
            switch result {
            case .success(let response):
                self?.missionsPreview = response
            case .failure(let error):
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    func finishedQuestsCount() -> Int {
        var finishedCount = 0
        for mission in missionsPreview ?? [] {
            finishedCount += mission.finishedQuests ?? 0
        }
        return finishedCount
    }
    
    func totalQuestsCount() -> Int {
        var totalCount = 0
        for mission in missionsPreview ?? [] {
            totalCount += mission.totalQuests ?? 0
        }
        return totalCount
    }
    
    convenience init() {
        self.init(service: MissionsService())
    }
    
    init(service: MissionsService) {
        self.service = service
        fetchMissionsPreviewData()
    }
}
