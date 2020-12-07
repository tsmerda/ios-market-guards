//
//  AvatarView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 07.12.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct AvatarView: View {
    @State var avatar: String
    
    var body: some View {
        Image(avatar)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.size.width / 2, height: UIScreen.main.bounds.size.width / 2)
            .clipped()
            .padding(1)
    }
}

//struct AvatarView_Previews: PreviewProvider {
//    static var previews: some View {
//        AvatarView()
//    }
//}
