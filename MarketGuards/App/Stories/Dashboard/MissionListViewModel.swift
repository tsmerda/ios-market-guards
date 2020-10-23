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
    
    private let service = MissionsService()
    
    func fetchMissionsPreviewData() {
        service.fetchMissionsPreview { [weak self] result in
            switch result {
            case .success(let response):
                self?.missionsPreview = response
            //                print(response)
            case .failure(let error):
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    func isFinished(totalQuests: Int, finishedQuests: Int) -> Bool {
        if ((totalQuests - finishedQuests) == 0) {
            return true
        } else {
            return false
        }
    }
    
    init() {
        fetchMissionsPreviewData()
    }
}
