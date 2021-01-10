//
//  StoreDetailView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 29.11.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct StoreDetailView: View {
    @StateObject var viewModel = StoreViewModel()
    @Binding var storeList: [StoreItem]
    var storeItem: StoreItem
    var appliable: Bool
    @Binding var currency: Int
    
    var body: some View {
        ZStack {
            Color("negative")
            VStack(spacing: 16) {
                ZStack {
                    GeometryReader { geometryReader in
                        Image("reward")
                            .resizable()
                            .foregroundColor(Color("mainExtraLight"))
                            .opacity(0.06)
                            .blur(radius: 2)
                            .rotationEffect(.degrees(-30))
                            .offset(x: 50)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometryReader.size.width)
                    }
                    .frame(height: 220)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 16) {
                            Text("\(storeItem.title)")
                                .font(.chakraPetchRegular(size: 24))
                                .foregroundColor(Color("mainExtraLight"))
                                .padding(.top)
                            
                            Spacer()
                            
                            Text("store_subtitle")
                                .font(.chakraPetchRegular(size: 14))
                                .foregroundColor(Color("mainExtraLight"))
                                .opacity(0.4)
                            
                            Text("\(storeItem.text)")
                                .font(.chakraPetchRegular(size: 14))
                                .foregroundColor(Color("mainExtraLight"))
                        }
                        Spacer()
                    }
                    .frame(height: 220)
                }
                Divider()
                    .background(Color(ColorsConstants.mainExtraLow))
                
                Text("store_own \(storeItem.bought)")
                    .font(.chakraPetchRegular(size: 12))
                    .foregroundColor(Color("warning"))
                
                if !appliable {
                    Button {
                        buyReward(storeItem)
                    } label: {
                        HStack {
                            Text("store_buy \(storeItem.price)")
                                .textCase(.uppercase)
                            Image("currency")
                        }
                        .frame(maxWidth: 224, alignment: .center)
                        .frame(height: 40.0)
                        .font(.chakraPetchSemiBold(size: 14))
                        .foregroundColor(Color("pureBlack"))
                        .background(Color("main"))
                        .cornerRadius(30.0)
                    }
                } else {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .frame(width: 230, height: 290)
                            .foregroundColor(Color("mainExtraLight"))
                            .cornerRadius(16)
                        
                        VStack {
                            Text("store_scan_qrcode")
                                .font(.chakraPetchRegular(size: 16))
                                .foregroundColor(Color("pureBlack"))
                                .frame(width: 200)
                            
                            Image(uiImage: viewModel.generateQRCode(from: "Odměna \(storeItem.title) uplatněna"))
                                .interpolation(.none)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding(.horizontal)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
    
    func buyReward(_ item: StoreItem) {
        if let index = storeList.firstIndex(where: { $0.id == item.id }){
            storeList[index].bought += 1
            currency -= storeList[index].price
        }
    }
}

//struct StoreDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        StoreDetailView(storeItem: StoreItem(image: "", title: "Reward title 1", text: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam erat volutpat. Praesent dapibus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam erat volutpat. Praesent dapibus. ", price: 50, left: 6))
//    }
//}
