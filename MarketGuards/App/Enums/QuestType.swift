//
//  QuestType.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

enum QuestType {
    case prepared(minutes: Int)
    case active(minutes: Int)
    case finished(date: String)
    
    var time: LocalizedStringKey {
        switch self {
        case .prepared(let minutes):
            return "Čas na splnění: \(minutes.minutesToRemainingTime)"
        case .active(let request):
            return "quests_remaining_time \(request)" // Add timer function
        case .finished(let date):
            return "Splněno: \(date)"
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
    
    var buttonText: LocalizedStringKey {
        switch self {
        case .prepared:
            return "quests_start_quest"
        case .active:
            return "quests_finish_quest"
        case .finished:
            return ""
        }
    }
    
    var buttonAction: String {
        switch self {
        case .prepared:
            return "activate"
        case .active:
            return "finish"
        case .finished:
            return ""
        }
    }
}
