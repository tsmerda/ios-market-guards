//
//  SettingsViewModel.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 01/11/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

class SettingsViewModel: ObservableObject {    
    private var settingsService = SettingsService()
    private var playerService = PlayerService()
    let idPlayer: String = TokenManager.shared.getFromToken("sub")
    let firstName: String = TokenManager.shared.getFromToken("firstName")
    let lastName: String = TokenManager.shared.getFromToken("lastName")
    let email: String = TokenManager.shared.getFromToken("email")
    let registerDate: String = TokenManager.shared.getFromToken("registerDate")
    private var currentUserManager: CurrentUserManager
    
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
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        
        return emailPredicate.evaluate(with: string)
    }
    
    func signOut() {
        CurrentUserManager.shared.removeAccessToken()
    }
    
    convenience init() {
        self.init(settingsService: SettingsService(), playerService: PlayerService(), currentUserManager: CurrentUserManager.shared)
    }
    
    init(settingsService: SettingsService, playerService: PlayerService, currentUserManager: CurrentUserManager) {
        self.settingsService = settingsService
        self.playerService = playerService
        self.currentUserManager = currentUserManager
    }
    
}
