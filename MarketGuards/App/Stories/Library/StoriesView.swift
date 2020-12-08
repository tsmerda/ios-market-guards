//
//  StoriesView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 29.11.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct StoriesView: View {
    var searchText: String
    @StateObject var viewModel = LibraryViewModel()
    @State var isTagListPresented: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                HStack {
                    HStack {
                        ForEach(viewModel.selectedTags) { tag in
                            Button {
                                viewModel.removeFromSelectedTags(tag)
                            } label: {
                                TagView(title: tag.title)
                            }
                        }
                    }
                }
                .foregroundColor(Color("mainExtraLight"))
                
                Spacer()
                
                Button {
                    isTagListPresented.toggle()
                } label: {
                    Image("filter")
                        .foregroundColor(Color("mainExtraLight"))
                }
                .sheet(isPresented: $isTagListPresented, content: { TagListView(isTagListPresented: $isTagListPresented, selectedTags: $viewModel.selectedTags) })
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(viewModel.storiesList.filter {
                        self.searchText.isEmpty ? true : $0.title.lowercased().contains(self.searchText.lowercased())
                    }) { story in
                        // TODO -- Add sort/search by selectedTags
                        NavigationLink(destination: StoryDetailView(storyItem: story)) {
                            StoryItemView(storyItem: story)
                        }
                        
                        Divider()
                            .background(Color(ColorsConstants.mainExtraLow))
                    }
                }
            }.padding(.leading)
        }
    }
}

//struct StoriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        StoriesView(searchText: "", viewModel: LibraryViewModel())
//    }
//}
