//
//  BestPracticeItemView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 01.12.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct BestPracticeItemView: View {
    var bestPracticeItem: BestPracticeItem
    
    var body: some View {
        HStack(spacing: 0) {
            Image(bestPracticeItem.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 75)
                .padding(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(bestPracticeItem.difficulty)
                    .font(.chakraPetchMedium(size: 12))
                    .foregroundColor(Color("disabled"))
                
                Text(bestPracticeItem.title)
                    .font(.chakraPetchBold(size: 14))
                    .foregroundColor(Color("mainExtraLight"))
                
                Text(bestPracticeItem.text)
                    .font(.chakraPetchMedium(size: 12))
                    .foregroundColor(Color("mainExtraLight"))
                    .lineLimit(2)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Color("mainExtraLightLow"))
                .padding(12)
        }
    }
}

struct BestPracticeItemView_Previews: PreviewProvider {
    static var previews: some View {
        BestPracticeItemView(bestPracticeItem: BestPracticeItem(image: "marcus", title: "Komunikace z očí do očí", text: "Nejdřív jsme začali chodit krmit na Náplavku, protože jsme tam nedaleko bydleli. Po dvou týdnech si na nás ta zvířata zvykla. Stačilo dát ruku před sebe a hned tam seděli.", difficulty: "Nováček"))
    }
}
