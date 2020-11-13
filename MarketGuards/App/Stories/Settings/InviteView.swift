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
    @State private var isEmailValid: Bool = true
    
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
                        TextField("", text: $email, onEditingChanged: { (isChanged) in
                            if !isChanged {
                                if self.textFieldValidatorEmail(self.email) {
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
                    .foregroundColor(Color("mainExtraLight"))
                    .padding(.horizontal, 16)
                    
                    if !self.isEmailValid {
                        Text("settings_email_not_valid")
                            .font(.chakraPetchRegular(size: 13))
                            .foregroundColor(Color("error"))
                    }
                    
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
                        .foregroundColor(Color((!isEmailValid || email.isEmpty || firstName.isEmpty || lastName.isEmpty) ? "disabled" : "mainExtraLight"))
                        .background(Color((!isEmailValid || email.isEmpty || firstName.isEmpty || lastName.isEmpty) ? "mainExtraLightExtraLow" : "mainExtraLightLow"))
                        .cornerRadius(15)
                }
                .disabled(!isEmailValid || email.isEmpty || firstName.isEmpty || lastName.isEmpty)
                
                Spacer()
            }
            .padding(16)
        }
        .navigationBarTitle(Text("settings_invite_player"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundColor(Color("mainExtraLight"))
        })
    }
    func textFieldValidatorEmail(_ string: String) -> Bool {
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        
        return emailPredicate.evaluate(with: string)
    }
}


struct InviteView_Previews: PreviewProvider {
    static var previews: some View {
        InviteView()
    }
}
