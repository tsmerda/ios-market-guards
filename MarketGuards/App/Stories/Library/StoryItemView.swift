//
//  StoryItemView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 29.11.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct StoryItemView: View {
    var storyItem: StoryItem
    
    var body: some View {
        HStack(spacing: 0) {
            Image(storyItem.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 121, height: 112)
                .foregroundColor(Color("mainExtraLight"))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(storyItem.title)
                    .lineLimit(1)
                    .font(.chakraPetchBold(size: 14))
                    .foregroundColor(Color("mainExtraLight"))
                
                HStack {
                    Text("\(storyItem.author) · \(storyItem.date)")
                        .font(.chakraPetchLight(size: 12))
                        .foregroundColor(Color("mainExtraLight"))
                }
                
                Text(storyItem.text)
                    .font(.chakraPetchMedium(size: 12))
                    .foregroundColor(Color("mainExtraLight"))
                    .lineLimit(2)
                    .padding(.bottom, 8)
                
                HStack {
                    ForEach(storyItem.tags) { tag in
                        TagView(title: tag.title)
                    }
                }
            }
            .padding(.leading, 8)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Color("mainExtraLightLow"))
                .padding(12)
        }
    }
}

//struct StoryItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        StoryItemView()
//    }
//}
