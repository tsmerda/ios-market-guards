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
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                    ZStack(alignment: .leading) {
                        if text.isEmpty {
                            Text(label)
                                .foregroundColor(Color(ColorsConstants.disabled))
                        }
                        TextField("", text: $text)
                            .foregroundColor(Color(ColorsConstants.mainExtraLight))
                            .autocapitalization(.none)
                    }
                } else if (type == .secured) {
                    Image(imageName)
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                    
                    ZStack(alignment: .leading) {
                        if text.isEmpty {
                            Text(label)
                                .foregroundColor(Color(ColorsConstants.disabled))
                        }
                        SecureField("", text: $text)
                            .foregroundColor(Color(ColorsConstants.mainExtraLight))
                            .autocapitalization(.none)
                    }
                }
            }
            .padding(.leading, 16)
            .frame(height: 48)
            .background(Color(ColorsConstants.mainExtraLightLow).opacity(0.5))
            .cornerRadius(30)
        }
    }
}

//struct TextFieldWithIcon_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFieldWithIcon()
//    }
//}
