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
        LoadingView(isShowing: .constant(viewModel.loading)) {
            ZStack {
                GeometryReader { geo in
                    Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width)
                        .edgesIgnoringSafeArea(.all)
                }
                VStack(alignment: .center, spacing: 72.0) {
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
                            viewModel.loginButtonPressed(login: viewModel.login, password: viewModel.password)
                        } label: {
                            ButtonWithBackground(text: "login", color: ColorsConstants.pureBlack ,backgroundColor: ColorsConstants.mainDark)
                                .frame(width: 180)
                        }
                        .padding(.top, 8)
                    }
                    .padding(16)
                    Spacer()
                        .frame(height: 100)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
