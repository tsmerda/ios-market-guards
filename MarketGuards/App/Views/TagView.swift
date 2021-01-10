//
//  TagView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 03.12.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct TagView: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.chakraPetchRegular(size: 12))
                .foregroundColor(Color("negativeSemi"))
                .padding(.horizontal, 8)
                .background(Color("mainExtraLight"))
                .cornerRadius(3)
                .padding(.trailing, 6)
        }
    }
}

//struct TagView_Previews: PreviewProvider {
//    static var previews: some View {
//        TagView()
//    }
//}
