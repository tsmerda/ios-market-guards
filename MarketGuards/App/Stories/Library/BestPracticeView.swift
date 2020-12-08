//
//  BestPracticeView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 29.11.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct BestPracticeView: View {
    var searchText: String
    @StateObject var viewModel = LibraryViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(viewModel.bestPracticeList) { tag in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        // TODO -- Show if searchText contains items of this letter
                        Text(tag.title)
                            .font(.chakraPetchMedium(size: 16))
                            .foregroundColor(Color("mainExtraLight"))

                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(tag.bestPracticeItem.filter {
                            self.searchText.isEmpty ? true : $0.title.lowercased().contains(self.searchText.lowercased())
                        }) { item in
                            NavigationLink(destination: BestPracticeDetailView(bestPracticeItem: item)) {
                                BestPracticeItemView(bestPracticeItem: item)
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

//struct BestPracticeView_Previews: PreviewProvider {
//    static var previews: some View {
//        BestPracticeView()
//    }
//}
