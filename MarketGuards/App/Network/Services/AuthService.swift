//
//  AuthService.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 27/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation
import Moya

class AuthService {
    let provider = MoyaProvider<AuthTarget>()
    func login(login: String, password: String, completion: @escaping (Result<Void, LoginError>) -> Void) {
        provider.request(.login(LoginRequest(login: login, password: password))) { result in
            switch result {
            case .success(let response):
                do {
                    let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: response.data)
                    //save token
                    CurrentUserManager.shared.setAccessToken(loginResponse.accessToken)
                    CurrentUserManager.shared.refreshToken = loginResponse.refreshToken
                    completion(.success(()))
                } catch {
                    do {
                        let failedResponse = try JSONDecoder().decode(LoginFailedResponse.self, from: response.data)
                        completion(.failure(.loginFailed(failedResponse.message)))
                    } catch {
                        completion(.failure(.generic))
                    }
                }
            case .failure(let error):
                completion(.failure(.moyaError(error)))
            }
        }
    }
}
