//
//  SettingsView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 30/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewModel()
    
    var body: some View {
        ZStack {
            Color(ColorsConstants.negative)
                .edgesIgnoringSafeArea(.bottom)
            VStack(spacing: 16) {
                HStack {
                    Text("settings_name")
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                        .opacity(0.8)
                    Spacer()
                    HStack {
                        Text(viewModel.firstName)
                        Text(viewModel.lastName)
                    }
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
                    .opacity(0.4)
                }
                .font(.chakraPetchRegular(size: 14))
                
                HStack {
                    Text("settings_email")
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                        .opacity(0.8)
                    Spacer()
                    Text(viewModel.email)
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                        .opacity(0.4)
                }
                .font(.chakraPetchRegular(size: 14))
                
                HStack {
                    Text("settings_registration_date")
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                        .opacity(0.8)
                    Spacer()
                    Text(viewModel.registerDate)
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                        .opacity(0.4)
                }
                .font(.chakraPetchRegular(size: 14))
                
                Divider()
                    .background(Color(ColorsConstants.mainExtraLow))
                
                NavigationLink(destination: ChangePasswordView()) {
                    MenuRowView(image: "", text: "settings_change_password")
                }
                NavigationLink(destination: InviteView()) {
                    MenuRowView(image: "", text: "settings_invite_player")
                }
                NavigationLink(destination: AboutView()) {
                    MenuRowView(image: "", text: "settings_about_application")
                }
                
                Spacer()
                
                Button {
                    viewModel.signOut()
                } label: {
                    ButtonWithBackground(text: "settings_logout", color: ColorsConstants.pureBlack, backgroundColor: ColorsConstants.mainExtraLight)
                        .frame(width: 175)
                }
            }
            .padding(16)
        }
        .navigationBarTitle(Text("settings"), displayMode: .inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
