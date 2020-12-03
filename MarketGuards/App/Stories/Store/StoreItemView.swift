//
//  StoreItemView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 29.11.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct StoreItemView: View {
    var image: String
    var title: String
    var text: String
    var price: Int
    var left: Int
    var count: Int
    
    var body: some View {
        HStack(spacing: 0) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 121, height: 112)
                .background(Color("disabledLow"))
                .padding(8)
            
            VStack(spacing: 0) {
                Spacer()
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.chakraPetchBold(size: 14))
                    Text(text)
                        .lineLimit(2)
                        .font(.chakraPetchRegular(size: 12))
                    Text("store_remaining \(left) \(count)")
                        .font(.chakraPetchRegular(size: 12))
                }
                .foregroundColor(Color("mainExtraLight"))
                .padding(.trailing, 8)
                
                Spacer()
                
                HStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .fill(Color("mainExtraLight"))
                            .cornerRadius(5)
                            .frame(width: 70, height: 28)
                        HStack {
                            Text("\(price)")
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
