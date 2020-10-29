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
    
    var topMenu: [String] {
        switch self {
        case .dashboard:
            return ["missions_active","missions_prepared","missions_finished"]
        case .questDetail:
            return ["quests_skills","quests_statistics","quests_notes"]
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
                    .font(subhead).bold()
                    .foregroundColor(index == menu ? Color("mainExtraLight") : Color("disabled"))
                
                Rectangle()
                    .fill(Color("mainExtraLightExtraLow"))
                    .opacity(index == menu ? 1 : 0)
                    .cornerRadius(/*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
                    .frame(height: 32)
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
