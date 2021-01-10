//
//  LibraryView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 28/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct LibraryView: View {
    @StateObject var viewModel = LibraryViewModel()
    @State var topIndex = 0
    @State private var searchText: String = ""
    
    var body: some View {
        ZStack {
            Color("negative")
            VStack(spacing: 16) {
                VStack {
                    SearchBar(text: $searchText)
                    HStack {
                        ForEach(0..<MenuType.library.topMenu.count) { menu in
                            TopMenu(menu: menu, index: $topIndex, menuType: MenuType.library)
                        }
                    }
                }
                .padding(.horizontal)
                
                if topIndex == 0 {
                    StoriesView(searchText: searchText, isTagListPresented: false)
                }
                
                if topIndex == 1 {
                    BestPracticeView(searchText: searchText)
                }
                
                if topIndex == 2 {
                    DictionaryView(searchText: searchText)
                }
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}

