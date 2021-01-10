//
//  GameStatusRow.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 07.12.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct GameStatusRow: View {
    @State var text: LocalizedStringKey
    @Binding var value: Int
    
    var body: some View {
        HStack {
            Text(text)
                .font(.chakraPetchRegular(size: 16))
                .foregroundColor(Color(ColorsConstants.disabled))
            
            Text("\(value)")
                .font(.chakraPetchBold(size: 16))
                .foregroundColor(Color(ColorsConstants.mainExtraLight))
        }
    }
}

//struct GameStatusRow_Previews: PreviewProvider {
//    static var previews: some View {
//        GameStatusRow()
//    }
//}
