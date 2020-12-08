//
//  ContentView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 27/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var selected = BottomMenu.dashboard
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                TabView(selection: $selected) {
                    DashboardView()
                        .tabItem({
                            Image(BottomMenu.dashboard.imageName)
                        })
                        .tag(BottomMenu.dashboard)
                    LibraryView()
                        .tabItem({
                            Image(BottomMenu.library.imageName)
                        })
                        .tag(BottomMenu.library)
                    StoreView()
                        .tabItem({
                            Image(BottomMenu.store.imageName)
                        })
                        .tag(BottomMenu.store)
                    UserProfileView()
                        .tabItem({
                            Image(BottomMenu.profile.imageName)
                        })
                        .tag(BottomMenu.profile)
                }
                .accentColor(Color(ColorsConstants.mainExtraLight))
                .navigationBarTitle(Text(""), displayMode: .inline)
                .navigationBarItems(leading: Text(selected.localizedName)
                                        .font(.chakraPetchMedium(size: 24))
                                        .foregroundColor(Color(ColorsConstants.mainExtraLight)))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
