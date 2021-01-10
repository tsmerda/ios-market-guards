//
//  CustomNavigationElements.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 13/11/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(Color("negative"))
        appearance.shadowColor = .clear
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(Color("mainExtraLight"))
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor(Color("mainExtraLight"))
        ]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = UIColor(Color("mainExtraLight"))
        
        UITabBar.appearance().barTintColor = UIColor(Color("negative"))
    }
}
