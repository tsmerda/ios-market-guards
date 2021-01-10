//
//  QuestType.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

enum QuestType {
    case active
    case finished
    case unfinished
    
    var timeText: LocalizedStringKey {
        switch self {
        case .active:
            return "quests_remaining_time"
        case .finished:
            return "quests_finished"
        case .unfinished:
            return "quests_unfinished"
        }
    }
    
    var timeIcon: String {
        switch self {
        case .active:
            return "remaining_time"
        case .finished:
            return "ok"
        case .unfinished:
            return "warning"
        }
    }
    
    var timeColor: String {
        switch self {
        case .active:
            return "warningLight"
        case .finished:
            return "successLight"
        case .unfinished:
            return "errorLight"
        }
    }
    
    func getRemainingTime(activated: String?, finished: Int?) -> Int {
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
    
    func getFinishedTime(activated: String?, finished: String?) -> Int {
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        
        dateFormatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss.SSS"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current

        let activatedDate = dateFormatter.date(from: activated ?? "") ?? Date()
        let finishedDate = dateFormatter.date(from: finished ?? "") ?? Date()
        
        let diffDate = calendar.dateComponents([.minute], from: activatedDate, to: finishedDate).minute
        
        return diffDate ?? 0
    }
}
