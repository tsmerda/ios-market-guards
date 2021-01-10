//
//  UserProfileView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct UserProfileView: View {
    @StateObject var viewModel = UserProfileViewModel()
    @State private var isEditProfilePresented = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Image(viewModel.avatar.lowercased())
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .overlay(Circle().stroke(Color(ColorsConstants.mainExtraLightLow)))
                        .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text(viewModel.nickName != "" ? viewModel.nickName : viewModel.firstName)
                            .font(.chakraPetchSemiBold(size: 20))
                            .foregroundColor(Color(ColorsConstants.mainExtraLight))
                            .padding(.bottom, 8)
                        
                        HStack(spacing: 24) {
                            VStack(alignment: .leading) {
                                GameStatusRow(text: "profile_level", value: .constant(viewModel.gameStatus?.level ?? 0))
                                
                                GameStatusRow(text: "profile_region", value: .constant(3))
                            }
                            
                            VStack(alignment: .leading) {
                                GameStatusRow(text: "profile_currency", value: .constant(viewModel.gameStatus?.currency ?? 0))
                                
                                GameStatusRow(text: "profile_week", value: .constant(24))
                            }
                        }
                    }
                    .padding(.leading, 24)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    Text("profile_xp")
                        .font(.chakraPetchRegular(size: 16))
                        .foregroundColor(Color(ColorsConstants.disabled))
                    
                    ProgressBar(value: .constant(CGFloat(viewModel.gameStatus?.experiences ?? 0)), maxValue: .constant(CGFloat(viewModel.gameStatus?.experiencesRangeTo ?? 0)),
                                color: ColorsConstants.main)
                    
                    Text("\(viewModel.gameStatus?.experiences ?? 0)/\(viewModel.gameStatus?.experiencesRangeTo ?? 0)")
                        .font(.chakraPetchRegular(size: 16))
                        .foregroundColor(Color(ColorsConstants.disabled))
                }
                .padding()
                
                Button {
                    isEditProfilePresented.toggle()
                } label: {
                    Text("profile_edit_profile")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 30.0)
                        .font(.chakraPetchMedium(size: 16))
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                        .background(Color(ColorsConstants.mainExtraLightExtraLow))
                        .cornerRadius(15)
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
                .sheet(isPresented: $isEditProfilePresented, content: { EditProfileView(isEditProfilePresented: $isEditProfilePresented) })
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Text("")
                        UserResourceView(image: "analysis", text: "profile_analysis", value: .constant(viewModel.gameStatus?.analysis ?? 0))
                        
                        UserResourceView(image: "contacts", text: "profile_contacts", value: .constant(viewModel.gameStatus?.contacts ?? 0))
                        
                        UserResourceView(image: "addressing", text: "profile_addressing", value: .constant(viewModel.gameStatus?.addressing ?? 0))
                        
                        UserResourceView(image: "consulting", text: "profile_consulting", value: .constant(viewModel.gameStatus?.consulting ?? 0))
                        
                        UserResourceView(image: "services", text: "profile_services", value: .constant(viewModel.gameStatus?.services ?? 0))
                    }
                    .padding(.horizontal, 8)
                }
                
                Divider()
                    .background(Color(ColorsConstants.mainExtraLow))
                    .padding(.vertical, 16)
                
                VStack(spacing: 16) {
                    NavigationLink(destination: SkillsView()) {
                        MenuRowView(image: "skills", text: "profile_skills")
                    }
                    
                    NavigationLink(destination: SettingsView()) {
                        MenuRowView(image: "settings", text: "profile_settings")
                    }
                }
                .padding(.horizontal, 16)
                
                Spacer()
            }
        }
        .background(
            ZStack {
                Color(ColorsConstants.negative)
            }
            .edgesIgnoringSafeArea(.vertical)
        )
        .onAppear {
            viewModel.fetchGameStatusData()
        }
    }
}


//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}
