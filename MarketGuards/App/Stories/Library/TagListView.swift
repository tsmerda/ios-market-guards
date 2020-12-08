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
    @Binding var selectedTags: [Tag]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(viewModel.storiesList) { story in
                        ForEach(story.tags) { tag in
                        Button {
                            addToSelectedTags(tag)
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
                            .background(Color(ColorsConstants.mainExtraLow))
                    }
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
    
    func addToSelectedTags(_ tag: Tag) {
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
