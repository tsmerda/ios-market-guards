//
//  ButtonWithBackground.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 28/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct ButtonWithBackground: View {
    var text: LocalizedStringKey
    var color: String
    var backgroundColor: String
    
    var body: some View {
        HStack {
            Text(text)
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(height: 40.0)
                .font(.chakraPetchSemiBold(size: 17))
                .foregroundColor(Color(color))
                .background(Color(backgroundColor))
                .cornerRadius(30.0)
        }
    }
}

//struct ButtonWithBackground_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonWithBackground()
//    }
//}
