//
//  StoreDetailView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 29.11.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct StoreDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel = StoreViewModel()
    var storeItem: StoreItem
    
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
                        
                    }.frame(height: 220)
                    
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
                    .frame(height: 220)
                }
                Divider()
                    .background(Color("mainLow"))
                
                Text("store_remaining \(storeItem.left)")
                    .font(.chakraPetchRegular(size: 12))
                    .foregroundColor(Color("warning"))
                
                Button {
                    viewModel.buyReward(item: storeItem)
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
                    .cornerRadius(/*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
                }
                
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(Color("mainExtraLight"))
        })
    }
}

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(storeItem: StoreItem(image: "", title: "Reward title 1", text: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam erat volutpat. Praesent dapibus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam erat volutpat. Praesent dapibus. ", price: 50, left: 6))
    }
}
