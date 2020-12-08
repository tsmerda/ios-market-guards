//
//  SettingsService.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 01/11/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation
import Moya

class SettingsService {
    let provider = AuthenticatedProvider<SettingsTarget>.buildProvider()
    
    func createInvitation(email: String, firstName: String, lastName: String, completion: @escaping (Result<Void, SettingsError>) -> Void) {
        provider.request(.createInvitation(CreateInvitationRequest(email: email, firstName: firstName, lastName: lastName))) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                completion(.failure(.underlying(error)))
            }
        }
    }
    
    func changePassword(idPlayer: String, oldPassword: String, newPassword: String, completion: @escaping (Result<Void, SettingsError>) -> Void) {
        provider.request(.changePassword(ChangePasswordRequest(idPlayer: idPlayer, oldPassword: oldPassword, newPassword: newPassword))) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                completion(.failure(.underlying(error)))
            }
        }
    }
}
