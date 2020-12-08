//
//  MenuRowView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 30/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct MenuRowView: View {
    @State var image: String
    @State var text: LocalizedStringKey
    
    var body: some View {
        HStack {
            if image != "" {
                Image(image)
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
                    .opacity(0.8)
            }
            Text(text)
                .font(.chakraPetchRegular(size: 14))
                .foregroundColor(Color(ColorsConstants.mainExtraLight))
                .opacity(0.8)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color(ColorsConstants.mainExtraLightLow))
        }
    }
}

//struct MenuRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuRowView()
//    }
//}
