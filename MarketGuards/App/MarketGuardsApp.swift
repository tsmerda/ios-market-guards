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
//    @EnvironmentObject var session: LoginViewModel
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}

//WindowGroup {
//    if !session.userLoggedIn {
//        LoginView()
//    } else {
//        ContentView()
//    }
//}
