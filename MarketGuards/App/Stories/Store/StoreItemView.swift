//
//  StoreItemView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 29.11.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct StoreItemView: View {
    var item: StoreItem
    
    var body: some View {
        HStack(spacing: 0) {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 121, height: 112)
                .background(Color("disabledLow"))
                .padding(8)
            
            VStack(spacing: 0) {
                Spacer()
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(item.title)
                            .font(.chakraPetchBold(size: 14))
                        Text(item.text)
                            .lineLimit(2)
                            .font(.chakraPetchRegular(size: 12))
                        Text("store_own \(item.bought)")
                            .font(.chakraPetchRegular(size: 12))
                    }
                    .foregroundColor(Color("mainExtraLight"))
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .fill(Color("mainExtraLight"))
                            .cornerRadius(5)
                            .frame(width: 70, height: 28)
                        HStack {
                            Text("\(item.price)")
                                .font(.chakraPetchBold(size: 14))
                                .foregroundColor(Color("pureBlack"))
                            Image("currency")
                                .foregroundColor(Color("pureBlack"))
                        }
                    }
                }
            }
        }
        .background(Color("disabledLow"))
        .cornerRadius(5)
    }
}

//struct StoreItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        StoreItemView()
//    }
//}
