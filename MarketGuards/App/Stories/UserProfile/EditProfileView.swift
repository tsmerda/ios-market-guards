//
//  EditProfileView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 30/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct EditProfileView: View {
    @StateObject var viewModel = SettingsViewModel()
    @Binding var isEditProfilePresented: Bool
    @State private var isChangeAvatarPresented = false
    @State private var avatar: String = TokenManager.shared.getFromToken("avatar")
    @State private var nickname: String = TokenManager.shared.getFromToken("nickName")
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Image("\(avatar)".lowercased())
                    .resizable()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fill)
                    .frame(width:150, height: 150)
                    .overlay(Circle().stroke(Color(ColorsConstants.mainExtraLightLow)))
                    .padding(.top, 32)
                    .padding(.bottom, 16)
                
                Button {
                    isChangeAvatarPresented.toggle()
                } label: {
                    Text("profile_change_photo")
                        .textCase(.uppercase)
                        .font(.chakraPetchMedium(size: 11))
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                }
                .padding(.bottom, 40)
                .sheet(isPresented: $isChangeAvatarPresented, content: { ChangeAvatarView(isChangeAvatarPresented: $isChangeAvatarPresented, avatar: $avatar) })
                
                TextField("", text: $nickname)
                    .font(.chakraPetchRegular(size: 24))
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
                    .multilineTextAlignment(.center)
                
                Divider()
                    .frame(width:215)
                    .background(Color(ColorsConstants.mainExtraLow))
                    .padding(.vertical, 8)
                
                Text("profile_change_nickname")
                    .font(.chakraPetchRegular(size: 13))
                    .foregroundColor(Color(ColorsConstants.disabled))
                
                Spacer()
            }
            .background(Color(ColorsConstants.negative))
            .navigationBarTitle(Text("Upravit profil"), displayMode: .inline)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: Button {
                isEditProfilePresented.toggle()
            } label: {
                Text("cancel")
                    .font(.chakraPetchMedium(size: 14))
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
            },
            trailing: Button{
                viewModel.editProfile(avatar: avatar, nickname: nickname)
                isEditProfilePresented.toggle()
            } label: {
                Text("save")
                    .font(.chakraPetchMedium(size: 14))
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
            })
        }
    }
}

//struct EditProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView()
//    }
//}
