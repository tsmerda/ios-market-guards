//
//  AboutView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 01/11/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct AboutView: View {    
    var body: some View {
        ZStack {
            Color(ColorsConstants.negative)
                .edgesIgnoringSafeArea(.bottom)
            VStack(spacing: 16) {
                HStack {
                    Text("settings_version")
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                        .opacity(0.8)
                    Spacer()
                    Text("1.0")
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                        .opacity(0.4)
                }
                
                Text("Gamifikovaná aplikace určená pro on-boarding zaměstnanců firmy Optimal-Energy.cz, a.s.")
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
                    .opacity(0.4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
            .font(.chakraPetchRegular(size: 14))
            .padding(16)
        }
        .navigationBarTitle(Text("settings_about_application"), displayMode: .inline)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
