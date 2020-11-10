//
//  QuestType.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

enum QuestType {
    case prepared
    case active
    case finished
    
    var timeText: LocalizedStringKey {
        switch self {
        case .prepared:
            return "quests_time_to_finish"
        case .active:
            return "quests_remaining_time"
        case .finished:
            return "quests_finished"
        }
    }
    
    var timeIcon: String {
        switch self {
        case .prepared:
            return "time"
        case .active:
            return "remaining_time"
        case .finished:
            return "ok"
        }
    }
    
    var timeColor: String {
        switch self {
        case .prepared:
            return "mainLight"
        case .active:
            return "warningLight"
        case .finished:
            return "successLight"
        }
    }
    
    func getDateDifference(activated: String?, finished: Int?) -> Int {
        let nowDate = Date()
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        
        dateFormatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss.SSS"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current

        let activatedDate = dateFormatter.date(from: activated ?? "")
        
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: activatedDate ?? Date())

        let finalActivatedDate = calendar.date(from:components) ?? Date()
        
        let finishDate = calendar.date(byAdding: .minute, value: finished ?? 0, to: finalActivatedDate) ?? Date()
        
        return Calendar.current.dateComponents([.second], from: nowDate, to: finishDate).second ?? 0
    }
}