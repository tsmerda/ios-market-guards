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
    case story
    case library
    case store
    
    var imageName: String {
        switch self {
        case .dashboard:
            return "person"
        case .story:
            return "star"
        case .library:
            return "book"
        case .store:
            return "cart"
        }
    }
    
    var imageNameSelected: String {
        return imageName + ".fill"
    }
    
    var localizedName: LocalizedStringKey {
        switch self {
        case .dashboard:
            return "dashboard"
        case .story:
            return "story"
        case .library:
            return "library"
        case .store:
            return "store"
        }
    }
    
    func provideImage(isSelected: Bool) -> Image {
        return isSelected ? Image(systemName: imageNameSelected) : Image(systemName: imageName)
    }
}
