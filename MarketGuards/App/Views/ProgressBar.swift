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
    @State var color: String = ColorsConstants.mainExtraLight
    @State var isShowing = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { geometryReader in
                Capsule()
                    .foregroundColor(Color(color + "Low"))
                
                if maxValue > value {
                    Capsule()
                        .foregroundColor(Color(color))
                        .shadow(color: Color(color), radius: 5)
                        .frame(width: self.isShowing ? geometryReader.size.width * (value / maxValue) : 0)
                        .animation(.easeOut(duration: 0.5))
                }
            }
            .frame(height: 12)
        }
        .onAppear {
            self.isShowing = true
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: .constant(65), maxValue: .constant(99), color: "main")
    }
}
