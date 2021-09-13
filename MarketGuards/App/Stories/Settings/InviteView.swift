//
//  InviteView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 01/11/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct InviteView: View {
    @StateObject var viewModel = SettingsViewModel()
    
    var body: some View {
        ZStack {
            Color(ColorsConstants.negative)
                .edgesIgnoringSafeArea(.bottom)
            VStack(spacing: 16) {
                VStack(spacing: 16) {
                    ZStack(alignment: .leading) {
                        if viewModel.firstName.isEmpty {
                            Text("settings_name")
                                .opacity(0.4)
                            
                        }
                        TextField("", text: $viewModel.firstName)
                            .autocapitalization(.none)
                    }
                    .font(.chakraPetchRegular(size: 13))
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
                    .padding(.horizontal, 16)
                    
                    Divider()
                        .background(Color(ColorsConstants.mainExtraLow))
                    
                    ZStack(alignment: .leading) {
                        if viewModel.lastName.isEmpty {
                            Text("settings_lastname")
                                .opacity(0.4)
                        }
                        TextField("", text: $viewModel.lastName)
                            .autocapitalization(.none)
                    }
                    .font(.chakraPetchRegular(size: 13))
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
                    .padding(.horizontal, 16)
                    
                    Divider()
                        .background(Color(ColorsConstants.mainExtraLow))
                    
                    ZStack(alignment: .leading) {
                        if viewModel.email.isEmpty {
                            Text("settings_email")
                                .opacity(0.4)
                        }
                        TextField("", text: $viewModel.email, onEditingChanged: { (isChanged) in
                            if !isChanged {
                                if viewModel.textFieldValidatorEmail(viewModel.email) {
                                    viewModel.isEmailValid = true
                                } else {
                                    viewModel.isEmailValid = false
                                    viewModel.email = ""
                                }
                            }
                        })
                        .autocapitalization(.none)
                    }
                    .font(.chakraPetchRegular(size: 13))
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
                    .padding(.horizontal, 16)
                    
                    if !viewModel.isEmailValid {
                        Text("settings_email_not_valid")
                            .font(.chakraPetchRegular(size: 13))
                            .foregroundColor(Color(ColorsConstants.error))
                    }
                    
                }
                .padding(.vertical, 16)
                .background(Color(ColorsConstants.mainExtraLightExtraLow))
                .cornerRadius(5)
                
                Button {
                    viewModel.createInvitation(email: viewModel.email, firstName: viewModel.firstName, lastName: viewModel.lastName)
                } label: {
                    Text("settings_send_invitation")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 30.0)
                        .font(.chakraPetchMedium(size: 16))
                        .foregroundColor(Color((viewModel.isDisabled()) ? ColorsConstants.disabled : ColorsConstants.mainExtraLight))
                        .background(Color((viewModel.isDisabled()) ? ColorsConstants.mainExtraLightExtraLow : ColorsConstants.mainExtraLightLow))
                        .cornerRadius(15)
                }
                .disabled(viewModel.isDisabled())
                
                Spacer()
            }
            .padding(16)
        }
        .navigationBarTitle(Text("settings_invite_player"), displayMode: .inline)
    }
}

struct InviteView_Previews: PreviewProvider {
    static var previews: some View {
        InviteView()
    }
}
