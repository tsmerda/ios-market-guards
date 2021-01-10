//
//  StoryDetailView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 29.11.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct StoryDetailView: View {
    @StateObject var viewModel = LibraryViewModel()
    var storyItem: StoryItem
    
    var body: some View {
        ZStack {
            Color("negative")
            VStack(spacing: 16) {
                VStack {
                    ZStack {
                        GeometryReader { geometryReader in
                            Image("marcus")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometryReader.size.width)
                        }
                        VStack {
                            Spacer()
                            HStack{
                                Text("\(storyItem.title)")
                                    .font(.chakraPetchBold(size: 24))
                                    .foregroundColor(Color("mainExtraLight"))
                                    .padding()
                                Spacer()
                            }
                        }
                    }
                }
                .frame(height: 280)
                
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Image("man_blue")
                            .resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 48, height: 48)
                            .padding(.trailing)
                        
                        VStack(alignment: .leading) {
                            Text("\(storyItem.author)")
                            HStack {
                                Text("\(storyItem.date)   · ")
                                Text("\(storyItem.place)   · ")
                                Text("\(storyItem.read) min čtení")
                            }
                        }
                        .font(.chakraPetchRegular(size: 12))
                        .foregroundColor(Color("disabled"))
                        
                        Spacer()
                    }
                    
                    Text("\(storyItem.text)")
                        .font(.chakraPetchRegular(size: 14))
                        .foregroundColor(Color("mainExtraLight"))
                    
                    Spacer()
                    
                    Divider()
                        .background(Color(ColorsConstants.mainExtraLow))
                    
                    HStack {
                        ForEach(storyItem.tags) { tag in
                            Text(tag.title)
                                .font(.chakraPetchRegular(size: 12))
                                .foregroundColor(Color("pureBlack"))
                                .padding(.horizontal, 8)
                                .background(Color("mainExtraLight"))
                                .cornerRadius(3)
                                .padding(.trailing, 6)
                        }
                        Spacer()
                    }
                }
                .padding(.init(top: 8, leading: 16, bottom: 48, trailing: 16))
                
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(storyItem: StoryItem(image: "reward", title: "Statečným přeje štěstí", text: "Ty zaznamenány list až dá spojení zarazí přemýšlet fakulty propůjčuje. Brzy dopředu charakterizuje stroj příliš EU jedenácti, sovětské zhlédlo předefinovávají rozdíly ji zmiňuje dnů vysokým mokřinách, pro list chaty snažila loveckou dokonce čili přijedu uplynuly samý u běhu musejí snažit. Dané malý, věc nějaký.", author: "Karel Zkušený", date: "2.června 2019", place: "Brno", read: 10, tags: [Tag(title: "analýza")]))
    }
}
