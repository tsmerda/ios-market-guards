//
//  FontNameManager.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 26/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct FontNameManager {
    struct ChakraPetch {
        static let light = "ChakraPetch-Light"
        static let medium = "ChakraPetch-Medium"
        static let regular = "ChakraPetch-Regular"
        static let semiBold = "ChakraPetch-SemiBold"
        static let bold = "ChakraPetch-Bold"
        static let italic = "ChakraPetch-Italic"
    }
}

let largeTitle = Font.custom(FontNameManager.ChakraPetch.regular, size: 34)

let title = Font.custom(FontNameManager.ChakraPetch.regular, size: 26)

let headline = Font.custom(FontNameManager.ChakraPetch.semiBold, size: 17)

let body = Font.custom(FontNameManager.ChakraPetch.regular, size: 17)

let callout = Font.custom(FontNameManager.ChakraPetch.regular, size: 16)

let subhead = Font.custom(FontNameManager.ChakraPetch.regular, size: 15)

let footnote = Font.custom(FontNameManager.ChakraPetch.regular, size: 13)

let caption = Font.custom(FontNameManager.ChakraPetch.regular, size: 12)
