//
//  TagListView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 03.12.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct TagListView: View {
    @StateObject var viewModel = LibraryViewModel()
    @Binding var isTagListPresented: Bool
    @Binding var selectedTags: [BestPracticeTag]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(viewModel.bestPracticeList) { tag in
                        Button {
                            addToSelectedTags(tag: tag)
                        } label: {
                            HStack {
                                Text(tag.title)
                                    .font(.chakraPetchRegular(size: 16))
                                    .padding(.vertical, 4)
                                
                                Spacer()
                                
                                if selectedTags.contains(where: { $0.title == tag.title }) {
                                    Image("ok")
                                }
                            }
                            .foregroundColor(Color("mainExtraLight"))
                        }
                        
                        Divider()
                            .background(Color("mainExtraLightExtraLow"))
                    }
                    
                    Spacer()
                }
            }
            .padding()
            .background(Color("negative"))
            .navigationBarTitle(Text("Seznam štítků"), displayMode: .inline)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(trailing: Button {
                isTagListPresented.toggle()
            } label: {
                Text("done")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color("mainExtraLight"))
            })
        }
    }
    
    func addToSelectedTags(tag: BestPracticeTag) {
        if !selectedTags.contains(where: { $0.title == tag.title }) {
            selectedTags.append(tag)
        } else if let index = selectedTags.firstIndex(where: { $0.title == tag.title }){
            selectedTags.remove(at: index)
        }
    }
}


//struct TagListView_Previews: PreviewProvider {
//    static var previews: some View {
//        TagListView()
//    }
//}
