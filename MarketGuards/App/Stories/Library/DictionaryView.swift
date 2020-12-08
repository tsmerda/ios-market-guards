//
//  DictionaryView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 29.11.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct DictionaryView: View {
    var searchText: String
    @StateObject var viewModel = LibraryViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(viewModel.dictionaryList) { letter in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        // TODO -- Show if searchText contains items of this letter
                        Text(letter.letter)
                            .font(.chakraPetchMedium(size: 16))
                            .foregroundColor(Color("mainExtraLight"))
                        
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(letter.dictionaryItem.filter {
                            self.searchText.isEmpty ? true : $0.title.lowercased().contains(self.searchText.lowercased())
                        }) { item in
                            NavigationLink(destination: DictionaryDetailView(dictionaryItem: item)) {
                                DictionaryItemView(dictionaryItem: item)
                            }
                            // TODO -- Hide Divider() at last element of an array
                            Divider()
                                .background(Color(ColorsConstants.mainExtraLow))
                        }
                    }
                    .background(Color("disabledLow"))
                    .cornerRadius(5)
                }
                .padding(.bottom, 8)
            }
        }
        .padding(.horizontal)
    }
}

//struct DictionaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        DictionaryView()
//    }
//}
