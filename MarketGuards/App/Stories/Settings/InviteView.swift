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
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var isEmailValid: Bool = true
    
    var body: some View {
        ZStack {
            Color(ColorsConstants.negative)
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
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
                    .padding(.horizontal, 16)
                    
                    Divider()
                        .background(Color(ColorsConstants.mainExtraLow))
                    
                    ZStack(alignment: .leading) {
                        if lastName.isEmpty {
                            Text("settings_lastname")
                                .opacity(0.4)
                        }
                        TextField("", text: $lastName)
                            .autocapitalization(.none)
                    }
                    .font(.chakraPetchRegular(size: 13))
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
                    .padding(.horizontal, 16)
                    
                    Divider()
                        .background(Color(ColorsConstants.mainExtraLow))
                    
                    ZStack(alignment: .leading) {
                        if email.isEmpty {
                            Text("settings_email")
                                .opacity(0.4)
                        }
                        TextField("", text: $email, onEditingChanged: { (isChanged) in
                            if !isChanged {
                                if self.viewModel.textFieldValidatorEmail(self.email) {
                                    self.isEmailValid = true
                                } else {
                                    self.isEmailValid = false
                                    self.email = ""
                                }
                            }
                        })
                        .autocapitalization(.none)
                    }
                    .font(.chakraPetchRegular(size: 13))
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
                    .padding(.horizontal, 16)
                    
                    if !self.isEmailValid {
                        Text("settings_email_not_valid")
                            .font(.chakraPetchRegular(size: 13))
                            .foregroundColor(Color(ColorsConstants.error))
                    }
                    
                }
                .padding(.vertical, 16)
                .background(Color(ColorsConstants.mainExtraLightExtraLow))
                .cornerRadius(5)
                
                Button {
                    viewModel.createInvitation(email: email, firstName: firstName, lastName: lastName)
                } label: {
                    Text("settings_send_invitation")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 30.0)
                        .font(.chakraPetchMedium(size: 16))
                        .foregroundColor(Color((!isEmailValid || email.isEmpty || firstName.isEmpty || lastName.isEmpty) ? ColorsConstants.disabled : ColorsConstants.mainExtraLight))
                        .background(Color((!isEmailValid || email.isEmpty || firstName.isEmpty || lastName.isEmpty) ? ColorsConstants.mainExtraLightExtraLow : ColorsConstants.mainExtraLightLow))
                        .cornerRadius(15)
                }
                .disabled(!isEmailValid || email.isEmpty || firstName.isEmpty || lastName.isEmpty)
                
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
