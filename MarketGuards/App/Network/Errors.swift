//
//  Errors.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 07.12.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

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

enum SettingsError: Error {
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
