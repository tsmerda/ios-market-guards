//
//  UserResourceView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct UserResourceView: View {
    let image: String
    let text: LocalizedStringKey
    @Binding var value: Int
    
    var body: some View {
        VStack(spacing: 4) {
            Image(image)
                .foregroundColor(Color(ColorsConstants.mainDark))
            
            Text(text)
                .font(.chakraPetchRegular(size: 14))
                .foregroundColor(Color(ColorsConstants.disabled))
            
            Text("\(value)")
                .font(.chakraPetchBold(size: 16))
                .foregroundColor(Color(ColorsConstants.mainExtraLight))
        }
        .frame(width: 100, height: 120)
        .background(Color(ColorsConstants.disabledLow))
        .cornerRadius(8)
    }
}

struct UserResourceView_Previews: PreviewProvider {
    static var previews: some View {
        UserResourceView(image: "analysis", text: "Analysis", value: .constant(1)).background(Color(ColorsConstants.mainExtraLow))
            .background(Color(ColorsConstants.negative))
    }
}
