//
//  StoreView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 28/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct StoreView: View {
    @StateObject var viewModel = StoreViewModel()
    @State var topIndex = 0
    
    var body: some View {
        ZStack {
            Color("negative")
            VStack(spacing: 16) {
                HStack {
                    ForEach(0..<MenuType.store.topMenu.count) { menu in
                        TopMenu(menu: menu, index: $topIndex, menuType: MenuType.store)
                    }
                }
                
                HStack {
                    HStack {
                        Text("1000")
                            .font(.chakraPetchMedium(size: 16))
                        Image("currency")
                    }
                    .foregroundColor(Color("mainExtraLight"))
                    Spacer()
                    Image("filter")
                        .foregroundColor(Color("mainExtraLight"))
                }
                
                if topIndex == 0 {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 16) {
                            ForEach(viewModel.StoreList) { storeItem in
                                NavigationLink(destination: StoreDetailView(storeItem: storeItem)) {
                                    StoreItemView(image: storeItem.image, title: storeItem.title, text: storeItem.text, price: storeItem.price, left: storeItem.left, count: storeItem.count)
                                }
                            }
                            Spacer()
                        }
                    }
                }
                
                if topIndex == 1 {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 16) {
                            ForEach(viewModel.StoreListBought) { storeItem in
                                NavigationLink(destination: StoreDetailView(storeItem: storeItem)) {
                                    StoreItemView(image: storeItem.image, title: storeItem.title, text: storeItem.text, price: storeItem.price, left: storeItem.left, count: storeItem.count)
                                }
                            }
                            Spacer()
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
