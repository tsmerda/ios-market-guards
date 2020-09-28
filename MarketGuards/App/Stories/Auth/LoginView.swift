//
//  LoginView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 27/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 120.0) {
                Spacer()
                VStack{
                    Image("logo")
                        .resizable()
                        .frame(width: 72.0, height: 72.0)
                    
                    Text("Market Guards")
                        .font(.system(size: 34, weight: .light))
                        .foregroundColor(Color("mainExtraLight"))
                }
                
                VStack(spacing: 16.0) {
                    TextFieldWithIcon(type: .generic, text: $viewModel.login, label: "login", imageName: "user")
                    
                    TextFieldWithIcon(type: .secured, text: $viewModel.password, label: "password", imageName: "lock")
                    
                    Button(action: {
                        self.viewModel.loginButtonPressed()
                    }, label: {
                        ButtonWithBackground(text: "login", color: "pureBlack" ,backgroundColor: "main")
                        
                    })
                    .padding(.top, 8)
                    NavigationLink(destination: ContentView()
                                    .navigationBarTitle(Text(""))
                                    .navigationBarHidden(true), isActive:
                                        self.$viewModel.userLoggedIn) {
                        EmptyView()
                    }
                }
                .padding(24)
                
                Spacer()
                    .frame(height: 48)
            }
            .background(
                ZStack {
                    Image("background").resizable()
                        .scaledToFill()
                    
                    
                    Rectangle()
                        .background(Color("negative"))
                        .opacity(0.6)
                    
                }.edgesIgnoringSafeArea(.all)
            )
            
        }
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
