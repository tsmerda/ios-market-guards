//
//  SettingsView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 30/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color("negative")
                .edgesIgnoringSafeArea(.bottom)
            VStack(spacing: 16) {
                HStack {
                    Text("settings_name")
                        .foregroundColor(Color("mainExtraLight"))
                        .opacity(0.8)
                    Spacer()
                    HStack {
                        Text("firstName".getFromToken)
                        Text("lastName".getFromToken)
                    }
                    .foregroundColor(Color("mainExtraLight"))
                    .opacity(0.4)
                }
                .font(.chakraPetchRegular(size: 14))
                
                HStack {
                    Text("settings_email")
                        .foregroundColor(Color("mainExtraLight"))
                        .opacity(0.8)
                    Spacer()
                    Text("email".getFromToken)
                        .foregroundColor(Color("mainExtraLight"))
                        .opacity(0.4)
                }
                .font(.chakraPetchRegular(size: 14))
                
                HStack {
                    Text("settings_registration_date")
                        .foregroundColor(Color("mainExtraLight"))
                        .opacity(0.8)
                    Spacer()
                    Text("registerDate".getFromToken)
                        .foregroundColor(Color("mainExtraLight"))
                        .opacity(0.4)
                }
                .font(.chakraPetchRegular(size: 14))
                
                Divider()
                
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
                    //                    viewModel.userLoggedIn = false
                } label: {
                    ButtonWithBackground(text: "settings_logout", color: "pureBlack", backgroundColor: "mainExtraLight")
                        .frame(width: 175)
                }
            }
            .padding(16)
        }
        .navigationBarTitle(Text("settings"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(Color("mainExtraLight"))
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
