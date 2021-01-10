//
//  TopMenu.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 11/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

enum MenuType {
    case dashboard
    case questDetail
    case store
    case library
    
    var topMenu: [String] {
        switch self {
        case .dashboard:
            return ["missions_active","missions_finished"]
        case .questDetail:
            return ["quests_skills","quests_statistics","quests_notes"]
        case .store:
            return ["store_to_buy","store_my_rewards"]
        case .library:
            return ["library_stories","library_best-practice","library_dictionary"]
        }
    }
}

struct TopMenu: View {
    var menu: Int
    @Binding var index: Int
    var menuType: MenuType
    
    var body: some View {
        Button {
            index = menu
        } label: {
            ZStack {
                Text(LocalizedStringKey(menuType.topMenu[menu]))
                    .font(.chakraPetchSemiBold(size: 15))
                    .foregroundColor(index == menu ? Color(ColorsConstants.mainExtraLight) : Color(ColorsConstants.disabled))
                
                Rectangle()
                    .fill(Color(ColorsConstants.mainExtraLightExtraLow))
                    .opacity(index == menu ? 1 : 0)
                    .cornerRadius(/*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
                    .frame(height: 30)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

//struct TopMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMenu()
//    }
//}
