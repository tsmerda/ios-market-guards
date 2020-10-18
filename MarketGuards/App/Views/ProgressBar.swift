//
//  ProgressBar.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 13/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: CGFloat
    @Binding var maxValue: CGFloat
    @State var color: String = "main"
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { geometryReader in
                Capsule()
                    .foregroundColor(Color(color + "Low"))
                
                if maxValue > value {
                    Capsule()
                        .foregroundColor(Color(color))
                        .shadow(color: Color(color), radius: 5)
                        .frame(width: geometryReader.size.width * (value / maxValue))
                }
                // TODO - resolve animation bug
                //                    .animation(.easeIn(duration: 1))
            }
            .frame(height: 12)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: .constant(65), maxValue: .constant(99), color: "main")
    }
}
