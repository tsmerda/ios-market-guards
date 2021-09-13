//
//  SkillRow.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 11/11/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct SkillRow: View {
    var skillPoints: [MissionDetailSkillCategoryResponse]
    
    @State private var totalHeight
        = CGFloat.zero         // << variant for ScrollView/List
    //  = CGFloat.infinity     // << variant for VStack
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)      // << variant for ScrollView/List
        //  .frame(maxHeight: totalHeight) // << variant for VStack
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(self.skillPoints, id: \.self) { skillPoint in
                SkillPoint(code: skillPoint.code, experiences: .constant(skillPoint.experiences  ?? 0), bonusExperiences: .constant(skillPoint.bonusExperiences ?? 0))
                    .padding([.trailing, .bottom], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width) {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if skillPoint == self.skillPoints.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if skillPoint == self.skillPoints.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }
        .background(viewHeightReader($totalHeight))
    }
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

//struct SkillRow_Previews: PreviewProvider {
//    static var previews: some View {
//        SkillRow()
//    }
//}
