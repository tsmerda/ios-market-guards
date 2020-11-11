//
//  UserProfileViewModel.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

enum GameStatusError: Error {
    case generic
    case underlying(Error)
    case incorrectEmailFormat //just example
    
    var localizedDescription: String {
        switch self {
        case .generic:
            return "Something went wrong."
        case .underlying(let error):
            return error.localizedDescription
        case .incorrectEmailFormat:
            return "Your mail is not in correct format."
        }
    }
}

enum SkillsError: Error {
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

class UserProfileViewModel: ObservableObject {
    @Published var gameStatus: GameStatusResponse?
    private var service = PlayerService()
    
    func fetchGameStatusData() {
        service.fetchGameStatus { [weak self] result in
            switch result {
            case .success(let response):
                self?.gameStatus = response
            //                print(response)
            case .failure(let error):
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    convenience init() {
        self.init(service: PlayerService())
    }
    
    init(service: PlayerService) {
        self.service = service
        fetchGameStatusData()
    }
}
