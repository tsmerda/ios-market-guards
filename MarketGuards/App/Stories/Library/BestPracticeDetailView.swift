//
//  BestPracticeDetailView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 01.12.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct BestPracticeDetailView: View {
    var bestPracticeItem: BestPracticeItem
    
    var body: some View {
        ZStack {
            Color("negative")
            VStack(alignment: .leading, spacing: 16) {
                VStack {
                    ZStack {
                        GeometryReader { geometryReader in
                            Image("marcus")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometryReader.size.width)
                        }
                        VStack {
                            Spacer()
                            HStack{
                                Text("\(bestPracticeItem.title)")
                                    .font(.chakraPetchBold(size: 24))
                                    .foregroundColor(Color("mainExtraLight"))
                                    .padding(.bottom)
                                Spacer()
                            }
                        }
                    }
                }
                .frame(height: 280)
                
                Text("\(bestPracticeItem.difficulty)")
                    .font(.chakraPetchRegular(size: 12))
                    .foregroundColor(Color("disabled"))
                
                Text("\(bestPracticeItem.text)")
                    .font(.chakraPetchRegular(size: 14))
                    .foregroundColor(Color("mainExtraLight"))
                
                Spacer()
                
            }
            .padding(.init(top: 8, leading: 16, bottom: 48, trailing: 16))
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

struct BestPracticeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BestPracticeDetailView(bestPracticeItem: BestPracticeItem(image: "marcus", title: "Pozorování klientů z povzdálí", text: "Nejdřív jsme začali chodit krmit na Náplavku, protože jsme tam nedaleko bydleli. Po dvou týdnech si na nás ta zvířata zvykla. Stačilo dát ruku před sebe a hned tam seděli. Samozřejmě lidi chodili kolem...", difficulty: "Nováček"))
    }
}
