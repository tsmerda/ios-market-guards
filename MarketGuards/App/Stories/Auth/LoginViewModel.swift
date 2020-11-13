//
//  LoginViewModel.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 27/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

enum LoginError: Error {
    case moyaError(Error)
    case loginFailed(String)
    case generic
    
    var localizedDescription: String {
        switch self {
        case.generic:
            return "Something went wrong"
        case .moyaError(let error):
            return error.localizedDescription
        case .loginFailed(let message):
            return message
        }
    }
}

class LoginViewModel: ObservableObject {
    @Published var login = "xsmerda@mendelu.cz"
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
