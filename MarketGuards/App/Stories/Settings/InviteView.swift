//
//  InviteView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 01/11/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct InviteView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel = SettingsViewModel()
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    
    var body: some View {
        ZStack {
            Color("negative")
                .edgesIgnoringSafeArea(.bottom)
            VStack(spacing: 16) {
                VStack(spacing: 16) {
                    ZStack(alignment: .leading) {
                        if firstName.isEmpty {
                            Text("settings_name")
                                .opacity(0.4)
                            
                        }
                        TextField("", text: $firstName)
                            .autocapitalization(.none)
                    }
                    .font(.chakraPetchRegular(size: 13))
                    .foregroundColor(Color("mainExtraLight"))
                    .padding(.horizontal, 16)
                    
                    Divider()
                        .background(Color("mainExtraLightLow"))
                    
                    ZStack(alignment: .leading) {
                        if lastName.isEmpty {
                            Text("settings_lastname")
                                .opacity(0.4)
                        }
                        TextField("", text: $lastName)
                            .autocapitalization(.none)
                    }
                    .font(.chakraPetchRegular(size: 13))
                    .foregroundColor(Color("mainExtraLight"))
                    .padding(.horizontal, 16)
                    
                    Divider()
                        .background(Color("mainExtraLightLow"))
                    
                    ZStack(alignment: .leading) {
                        if email.isEmpty {
                            Text("settings_email")
                                .opacity(0.4)
                        }
                        TextField("", text: $email)
                            .autocapitalization(.none)
                    }
                    .font(.chakraPetchRegular(size: 13))
                    .foregroundColor(Color("mainExtraLight"))
                    .padding(.horizontal, 16)
                }
                .padding(.vertical, 16)
                .background(Color("mainExtraLightExtraLow"))
                .cornerRadius(5)
                
                Button {
                    viewModel.createInvitation(email: email, firstName: firstName, lastName: lastName)
                } label: {
                    Text("settings_send_invitation")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 30.0)
                        .font(.chakraPetchMedium(size: 16))
                        .foregroundColor(Color("mainExtraLight"))
                        .background(Color("mainExtraLightLow"))
                        .cornerRadius(15)
                }
                Spacer()
            }
            .padding(16)
        }
        .navigationBarTitle(Text("settings_invite_player"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(Color("mainExtraLight"))
        })
    }
}

struct InviteView_Previews: PreviewProvider {
    static var previews: some View {
        InviteView()
    }
}
