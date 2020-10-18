//
//  ContentView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 27/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

enum BottomMenu {
    case dashboard
    case story
    case library
    case store
    
    var imageName: String {
        switch self {
        case .dashboard:
            return "person"
        case .story:
            return "star"
        case .library:
            return "book"
        case .store:
            return "cart"
        }
    }
    
    var imageNameSelected: String {
        return imageName + ".fill"
    }
    
    var localizedName: LocalizedStringKey {
        switch self {
        case .dashboard:
            return "dashboard"
        case .story:
            return "story"
        case .library:
            return "library"
        case .store:
            return "store"
        }
    }
}

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
                    .tabItem({ BottomMenu.dashboard == selected ? Image(systemName: BottomMenu.dashboard.imageNameSelected) : Image(systemName: BottomMenu.dashboard.imageName)
                                Text(BottomMenu.dashboard.localizedName) })
                    .tag(BottomMenu.dashboard)
                StoryView()
                    .tabItem({ BottomMenu.story == selected ? Image(systemName: BottomMenu.story.imageNameSelected) : Image(systemName: BottomMenu.story.imageName)
                                Text(BottomMenu.story.localizedName) })
                    .tag(BottomMenu.story)
                LibraryView()
                    .tabItem({ BottomMenu.library == selected ? Image(systemName: BottomMenu.library.imageNameSelected) : Image(systemName: BottomMenu.library.imageName)
                                Text(BottomMenu.library.localizedName) })
                    .tag(BottomMenu.library)
                StoreView()
                    .tabItem({ BottomMenu.store == selected ? Image(systemName: BottomMenu.store.imageNameSelected) : Image(systemName: BottomMenu.store.imageName)
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
