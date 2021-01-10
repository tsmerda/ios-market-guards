//
//  MissionRow.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 29/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct MissionRow: View {
    @State var title: String
    @State var totalQuests: Int
    @State var finishedQuests: Int
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(getCount(totalQuests: totalQuests, finishedQuests: finishedQuests))
            Image(getImage(totalQuests: totalQuests, finishedQuests: finishedQuests))
        }
        .font(.chakraPetchRegular(size: 16))
        .foregroundColor(Color(getColor(totalQuests: totalQuests, finishedQuests: finishedQuests)))
    }
    
    func getCount(totalQuests: Int, finishedQuests: Int) -> String {
        return (totalQuests != finishedQuests) ? "\(finishedQuests) / \(totalQuests)" : ""
    }
    
    func getColor(totalQuests: Int, finishedQuests: Int) -> String {
        if (totalQuests != 0 || finishedQuests != 0) {
            return isFinished(totalQuests: totalQuests, finishedQuests: finishedQuests) ? ColorsConstants.success : ColorsConstants.main
        } else {
            return ColorsConstants.disabled
        }
    }
    
    func getImage(totalQuests: Int, finishedQuests: Int) -> String {
        if (totalQuests != 0 || finishedQuests != 0)  {
            return isFinished(totalQuests: totalQuests, finishedQuests: finishedQuests) ? "ok" : "remaining_time"
        } else {
            return "lock"
        }
    }
    
    func isFinished(totalQuests: Int, finishedQuests: Int) -> Bool {
        return (totalQuests - finishedQuests) == 0
    }
}

//struct MissionRow_Previews: PreviewProvider {
//    static var previews: some View {
//        MissionRow()
//    }
//}
