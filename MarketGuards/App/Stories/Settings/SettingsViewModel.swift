//
//  SettingsViewModel.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 01/11/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

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

class SettingsViewModel: ObservableObject {    
    private var settingsService = SettingsService()
    private var playerService = PlayerService()
    
    func createInvitation(email: String, firstName: String, lastName: String) {
        settingsService.createInvitation(email: email, firstName: firstName, lastName: lastName) { result in
            switch result {
            case .success(let response):
                // TODO - fix service completion to print this response
                print(response)
            case .failure(let error):
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    func changePassword(idPlayer: String, oldPassword: String, newPassword: String) {
        settingsService.changePassword(idPlayer: idPlayer, oldPassword: oldPassword, newPassword: newPassword) { result in
            switch result {
            case .success:
                break
                // TODO - fix service completion to print this response
            case .failure(let error):
                print(error)
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    func editProfile(avatar: String, nickname: String) {
        playerService.editProfile(avatar: avatar, nickname: nickname) { result in
            switch result {
            case .success(let response):
                // TODO - fix service completion to print this response
                print(response)
            case .failure(let error):
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    convenience init() {
        self.init(settingsService: SettingsService(), playerService: PlayerService())
    }
    
    init(settingsService: SettingsService, playerService: PlayerService) {
        self.settingsService = settingsService
        self.playerService = playerService
    }
    
}
