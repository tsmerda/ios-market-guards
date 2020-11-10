//
//  FontNameManager.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 26/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

extension Font {
    static func chakraPetchLight(size: CGFloat) -> Font {
        return Font.custom("ChakraPetch-Light", size: size)
    }
    static func chakraPetchMedium(size: CGFloat) -> Font {
        return Font.custom("ChakraPetch-Medium", size: size)
    }
    static func chakraPetchRegular(size: CGFloat) -> Font {
        return Font.custom("ChakraPetch-Regular", size: size)
    }
    static func chakraPetchSemiBold(size: CGFloat) -> Font {
        return Font.custom("ChakraPetch-SemiBold", size: size)
    }
    static func chakraPetchBold(size: CGFloat) -> Font {
        return Font.custom("ChakraPetch-Bold", size: size)
    }
    static func chakraPetchItalic(size: CGFloat) -> Font {
        return Font.custom("ChakraPetch-Italic", size: size)
    }
}
