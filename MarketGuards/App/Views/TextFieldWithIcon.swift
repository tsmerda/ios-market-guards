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
                        .foregroundColor(Color("main"))
                    TextField(label, text: $text)
                        .foregroundColor(Color("main"))
                        .autocapitalization(.none)
                } else if (type == .secured) {
                    Image(imageName)
                        .foregroundColor(Color("main"))
                    SecureField(label, text: $text)
                        .foregroundColor(Color("main"))
                        .autocapitalization(.none)
                }
            }
            Divider()
                .frame(height: 1)
                .padding(.horizontal, 16)
                .background(Color("mainDarkLow"))
                .padding(.vertical, 4)
        }
    }
}

//struct TextFieldWithIcon_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFieldWithIcon()
//    }
//}
