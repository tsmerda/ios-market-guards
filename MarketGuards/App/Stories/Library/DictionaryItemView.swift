//
//  DictionaryItemView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 30.11.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct DictionaryItemView: View {
    var dictionaryItem: DictionaryItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 4) {
                Text(dictionaryItem.title)
                    .font(.chakraPetchBold(size: 14))
                
                Text(dictionaryItem.description)
                    .lineLimit(2)
                    .font(.chakraPetchRegular(size: 12))
            }
            .padding(12)
            .foregroundColor(Color("mainExtraLight"))

            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Color("mainExtraLightLow"))
                .padding(12)
        }
    }
}

//struct DictionaryItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        DictionaryItemView()
//    }
//}
