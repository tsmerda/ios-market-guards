//
//  BottomMenu.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

enum BottomMenu {
    case dashboard
    case library
    case store
    case profile
    
    var imageName: String {
        switch self {
        case .dashboard:
            return "dashboard"
        case .library:
            return "library"
        case .store:
            return "store"
        case .profile:
            return "user"
        }
    }
    
    var localizedName: LocalizedStringKey {
        switch self {
        case .dashboard:
            return "dashboard"
        case .library:
            return "library"
        case .store:
            return "store"
        case .profile:
            return "profile"
        }
    }
    
    //    MARK: If selected color is different
    
    //    private var imageNameSelected: String {
    //        return imageName + ".fill"
    //    }
    
    //    func provideImage(isSelected: Bool) -> Image {
    //        return isSelected ? Image(systemName: imageNameSelected) : Image(systemName: imageName)
    //    }
}
