//
//  MarketGuardsApp.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 27/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

@main
struct MarketGuardsApp: App {
    @StateObject var viewModel = CurrentUserManager.shared
    
    var body: some Scene {
        WindowGroup {
            if viewModel.accessToken == nil {
                LoginView().preferredColorScheme(.dark)
            } else {
                ContentView().preferredColorScheme(.dark)
            }
        }
    }
}
