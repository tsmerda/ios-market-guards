//
//  TextFieldWithIcon.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 28/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

enum TextFieldType {
    case secured
    case generic
}

struct TextFieldWithIcon: View {
    let type: TextFieldType
    @Binding var text: String
    let label: LocalizedStringKey
    let imageName: String
    
    var body: some View {
        VStack {
            HStack {
                if (type == .generic) {
                    Image(imageName)
                        .foregroundColor(Color("mainExtraLight"))
                    
                    TextField(label, text: $text)
                        .foregroundColor(Color("mainExtraLight"))
                        .autocapitalization(.none)
                } else if (type == .secured) {
                    Image(imageName)
                        .foregroundColor(Color("mainExtraLight"))
                    
                    SecureField(label, text: $text)
                        .foregroundColor(Color("mainExtraLight"))
                        .autocapitalization(.none)
                }
            }
            .padding(.leading, 16)
            .frame(height: 48)
            .background(Color("mainExtraLightLow").opacity(0.5))
            .cornerRadius(30)
        }
    }
}

//struct TextFieldWithIcon_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFieldWithIcon()
//    }
//}
