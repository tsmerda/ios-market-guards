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
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(Color(color))
                .background(Color(backgroundColor))
                .cornerRadius(/*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
        }
    }
}

//struct ButtonWithBackground_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonWithBackground()
//    }
//}
