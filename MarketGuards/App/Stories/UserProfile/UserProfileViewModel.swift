//
//  UserProfileViewModel.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

class UserProfileViewModel: ObservableObject {
    @Published var gameStatus: GameStatusResponse?
    let avatar: String = TokenManager.shared.getFromToken("avatar")
    let nickName: String = TokenManager.shared.getFromToken("nickName")
    let firstName: String = TokenManager.shared.getFromToken("firstName")
    
    private var service = PlayerService()
    
    func fetchGameStatusData() {
        service.fetchGameStatus { [weak self] result in
            switch result {
            case .success(let response):
                self?.gameStatus = response
//                            print(response)
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
    }
}
