//
//  String+TimeFormatting.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 11/11/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

extension String {
    var formatFinishedDate: String {
        let dateFormatter = DateFormatter()
        let dateFormatterFinished = DateFormatter()
        let calendar = Calendar.current
        
        dateFormatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss.SSS"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        dateFormatterFinished.dateFormat = "dd.MM.yyyy HH:mm"
        
        let date = dateFormatter.date(from: self)
        
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date ?? Date())

        let formattedDate = calendar.date(from:components) ?? Date()
        
        return dateFormatterFinished.string(from: formattedDate)
    }
}
