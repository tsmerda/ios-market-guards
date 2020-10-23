//
//  ContentView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 27/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(Color("negative"))
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor(Color("mainExtraLight"))]
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(Color("mainExtraLight")),
            .font : UIFont.systemFont(ofSize: 24)
        ]
        UITabBar.appearance().barTintColor = UIColor(Color("negative"))
    }
    
    @State private var selected = BottomMenu.dashboard
    @State private var isUserViewPresented = false
    
    var body: some View {
        
        NavigationView {
            TabView(selection: $selected) {
                DashboardView()
                    .tabItem({
                BottomMenu.dashboard.provideImage(isSelected: BottomMenu.dashboard == selected)
                                Text(BottomMenu.dashboard.localizedName) })
                    .tag(BottomMenu.dashboard)
                StoryView()
                    .tabItem({ BottomMenu.story.provideImage(isSelected: BottomMenu.story == selected)
                                Text(BottomMenu.story.localizedName) })
                    .tag(BottomMenu.story)
                LibraryView()
                    .tabItem({ BottomMenu.library.provideImage(isSelected: BottomMenu.library == selected)
                                Text(BottomMenu.library.localizedName) })
                    .tag(BottomMenu.library)
                StoreView()
                    .tabItem({ BottomMenu.store.provideImage(isSelected: BottomMenu.store == selected)
                                Text(BottomMenu.store.localizedName) })
                    .tag(BottomMenu.store)
                
            }
            .accentColor(Color("mainExtraLight"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
