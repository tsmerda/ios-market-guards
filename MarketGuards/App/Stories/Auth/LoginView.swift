//
//  LoginView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 27/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 120.0) {
                Spacer()
                Image("logo_vertical")
                    .resizable()
                    .frame(width: 125.0, height: 140.0)
                
                VStack(spacing: 16) {
                    HStack {
                        if !viewModel.alert.isEmpty {
                            Image(ColorsConstants.warning)
                        }
                        Text(LocalizedStringKey("\(viewModel.alert)".lowercased()))
                    }
                    .frame(height: 24)
                    .font(.chakraPetchRegular(size: 13))
                    .foregroundColor(Color(ColorsConstants.error))
                    
                    TextFieldWithIcon(type: .generic, text: $viewModel.login, label: "user_login", imageName: "name")
                    
                    TextFieldWithIcon(type: .secured, text: $viewModel.password, label: "password", imageName: "lock")
                    
                    Button {
                        viewModel.loginButtonPressed()
                    } label: {
                        ButtonWithBackground(text: "login", color: ColorsConstants.pureBlack ,backgroundColor: ColorsConstants.mainDark)
                            .frame(width: 175)
                    }
                    .padding(.top, 8)
                    NavigationLink(destination: ContentView()
                                    .navigationBarTitle(Text(""))
                                    .navigationBarHidden(true), isActive:
                                        $viewModel.userLoggedIn) {
                        EmptyView()
                    }
                }
                .padding(16)
                
                Spacer()
                    .frame(height: 48)
            }
            .background(
                ZStack {
                    Image("background")
                        .resizable()
                        .scaledToFill()
                    
                    Rectangle()
                        .background(Color(ColorsConstants.loginBackground))
                        .opacity(0.6)
                }
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
