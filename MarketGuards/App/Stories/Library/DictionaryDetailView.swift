//
//  DictionaryDetailView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 30.11.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct DictionaryDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var dictionaryItem: DictionaryItem
    
    var body: some View {
        ZStack {
            Color("negative")
            VStack(alignment: .leading, spacing: 16) {
                Text(dictionaryItem.title)
                    .font(.chakraPetchBold(size: 24))
                
                Text(dictionaryItem.description)
                    .font(.chakraPetchRegular(size: 14))
                Spacer()
            }
            .foregroundColor(Color("mainExtraLight"))
            .padding()
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(Color("mainExtraLight"))
        })
    }
}

//struct DictionaryDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DictionaryDetailView()
//    }
//}
