//
//  DashboardViewModel.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 28/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

enum MissionsError: Error {
    case generic
    case underlying(Error)
    
    var localizedDescription: String {
        switch self {
        case .generic:
            return "Something went wrong."
        case .underlying(let error):
            return error.localizedDescription
        }
    }
}

class DashboardViewModel: ObservableObject {
    @Published var missionDetail: MissionDetailResponse?
    @Published var missionId: Int?
    
    private var service = MissionsService()
    
    func fetchMissionDetailData(missionId: Int) {
        service.fetchMissionDetail(missionId: missionId) { [weak self] result in
            switch result {
            case .success(let response):
                self?.missionDetail = response
            case .failure(let error):
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    convenience init() {
        self.init(service: MissionsService())
    }
    
    init(service: MissionsService) {
        self.service = service
    }
}
