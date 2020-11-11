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
    let value: Int
    
    var body: some View {
        VStack(spacing: 4) {
            Image(image)
                .foregroundColor(Color("mainDark"))
            
            Text(text)
                .font(.chakraPetchRegular(size: 14))
                .foregroundColor(Color("disabled"))
            
            Text("\(value)")
                .font(.chakraPetchBold(size: 16))
                .foregroundColor(Color("mainExtraLight"))
        }
        .frame(width: 100, height: 120)
        .background(Color("disabledLow"))
        .cornerRadius(8)
    }
}

struct UserResourceView_Previews: PreviewProvider {
    static var previews: some View {
        UserResourceView(image: "analysis", text: "Analysis", value: 1).background(Color("mainExtraLow"))
            .background(Color("negative"))
    }
}
