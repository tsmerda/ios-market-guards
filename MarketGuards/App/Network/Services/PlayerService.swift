//
//  PlayerService.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation
import Moya

class PlayerService {
    let provider = AuthenticatedProvider<PlayerTarget>.buildProvider()
    
    func fetchGameStatus(completion: @escaping (Result<GameStatusResponse, GameStatusError>) -> Void) {
        provider.request(.gameStatus) { result in
            switch result {
            case .success(let response):
                do {
                    let gameStatus = try response
                        .filterSuccessfulStatusCodes()
                        .map(GameStatusResponse.self)
                    completion(.success(gameStatus))
                } catch {
                    print("Failed decoding with: \(error.localizedDescription)")
                    completion(.failure(.generic))
                }
                
            case .failure(let error):
                completion(.failure(.underlying(error)))
            }
        }
    }
    
    func editProfile(avatar: String, nickname: String, completion: @escaping (Result<Void, SettingsError>) -> Void) {
        provider.request(.editProfile(EditProfileRequest(avatar: avatar, nickname: nickname))) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                completion(.failure(.underlying(error)))
            }
        }
    }
}
