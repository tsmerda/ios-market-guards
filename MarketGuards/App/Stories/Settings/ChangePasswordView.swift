//
//  ChangePasswordView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 01/11/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct ChangePasswordView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel = SettingsViewModel()
    @State private var oldPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmNewPassword: String = ""
    
    var body: some View {
        ZStack {
            Color("negative")
                .edgesIgnoringSafeArea(.bottom)
            VStack(spacing: 16) {
                VStack(spacing: 16) {
                    ZStack(alignment: .leading) {
                        if oldPassword.isEmpty {
                            Text("settings_actual_password")
                                .opacity(0.4)
                            
                        }
                        SecureField("", text: $oldPassword)
                            .autocapitalization(.none)
                    }
                    .font(.chakraPetchRegular(size: 13))
                    .foregroundColor(Color("mainExtraLight"))
                    .padding(.horizontal, 16)
                    
                    Divider()
                        .background(Color("mainExtraLightLow"))
                    
                    ZStack(alignment: .leading) {
                        if newPassword.isEmpty {
                            Text("settings_new_password")
                                .opacity(0.4)
                        }
                        SecureField("", text: $newPassword)
                            .autocapitalization(.none)
                    }
                    .font(.chakraPetchRegular(size: 13))
                    .foregroundColor(Color("mainExtraLight"))
                    .padding(.horizontal, 16)
                    
                    Divider()
                        .background(Color("mainExtraLightLow"))
                    
                    ZStack(alignment: .leading) {
                        if confirmNewPassword.isEmpty {
                            Text("settings_confirm_new_password")
                                .opacity(0.4)
                        }
                        SecureField("", text: $confirmNewPassword)
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
                    if newPassword == confirmNewPassword {
                        viewModel.changePassword(idPlayer: "sub".getFromToken, oldPassword: oldPassword.sha256, newPassword: newPassword.sha256)
                    }
                } label: {
                    Text("confirm")
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
        .navigationBarTitle(Text("settings_change_password"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(Color("mainExtraLight"))
        })
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
