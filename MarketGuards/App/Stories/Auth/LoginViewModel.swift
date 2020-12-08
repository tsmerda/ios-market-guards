//
//  LoginViewModel.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 27/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var login = "tomas.smerda@threatmark.com"
    @Published var password = "g"
    @Published var userLoggedIn = false
    @Published var alert: String = ""
    
    let service = AuthService()
    
    func loginButtonPressed() {
        service.login(login: login, password: password) { [weak self] result in
            switch result {
            case .success:
                print("successfuly logged in")
                self?.userLoggedIn = true
            case .failure(let error):
                self?.alert = error.localizedDescription
                print("failed to log in with: \(error.localizedDescription)")
            }
        }
    }
}
