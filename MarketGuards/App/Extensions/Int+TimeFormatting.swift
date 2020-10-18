//
//  Int+TimeFormatting.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 10/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

extension Int {
    var minutesToRemainingTime: String {
        let interval = self * 60 // minutes to seconds
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .full
        return formatter.string(from: TimeInterval(interval))!
    }
    
    // TODO: Resolve formatting datetime
    
//    var formatDateTime: String {
//        let dateTime = self
//        let formatter = DateFormatter()
//        formatter.dateFormat = "HH:mm E, d MMM y"
//        return formatter.string(from: dateTime)
//    }
}
