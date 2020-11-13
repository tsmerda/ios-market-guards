//
//  UserProfileView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject var viewModel = UserProfileViewModel()
    @State private var isEditProfilePresented = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Image("\("avatar".getFromToken)".lowercased())
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .overlay(Circle().stroke(Color("mainExtraLightLow")))
                        .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("firstName".getFromToken)
                            .font(.chakraPetchSemiBold(size: 20))
                            .foregroundColor(Color("mainExtraLight"))
                            .padding(.bottom, 8)
                        
                        HStack(spacing: 24) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("profile_level")
                                        .font(.chakraPetchRegular(size: 16))
                                        .foregroundColor(Color("disabled"))
                                    
                                    Text("\(viewModel.gameStatus?.level ?? 0)")
                                        .font(.chakraPetchBold(size: 16))
                                        .foregroundColor(Color("mainExtraLight"))
                                }
                                
                                HStack {
                                    Text("profile_region")
                                        .font(.chakraPetchRegular(size: 16))
                                        .foregroundColor(Color("disabled"))
                                    
                                    Text("3")
                                        .font(.chakraPetchBold(size: 16))
                                        .foregroundColor(Color("mainExtraLight"))
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("profile_currency")
                                        .font(.chakraPetchRegular(size: 16))
                                        .foregroundColor(Color("disabled"))
                                    
                                    Text("\(viewModel.gameStatus?.currency ?? 0)")
                                        .font(.chakraPetchBold(size: 16))
                                        .foregroundColor(Color("mainExtraLight"))
                                }
                                
                                HStack {
                                    Text("profile_week")
                                        .font(.chakraPetchRegular(size: 16))
                                        .foregroundColor(Color("disabled"))
                                    
                                    Text("24")
                                        .font(.chakraPetchBold(size: 16))
                                        .foregroundColor(Color("mainExtraLight"))
                                }
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
                        .foregroundColor(Color("disabled"))
                    
                    ProgressBar(value: .constant(CGFloat(viewModel.gameStatus?.experiences ?? 0)), maxValue: .constant(CGFloat(viewModel.gameStatus?.experiencesRangeTo ?? 0)),
                                color: "main")
                    
                    Text("\(viewModel.gameStatus?.experiences ?? 0)/\(viewModel.gameStatus?.experiencesRangeTo ?? 0)")
                        .font(.chakraPetchRegular(size: 16))
                        .foregroundColor(Color("disabled"))
                }
                .padding()
                
                Button {
                    isEditProfilePresented.toggle()
                } label: {
                    Text("profile_edit_profile")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 30.0)
                        .font(.chakraPetchMedium(size: 16))
                        .foregroundColor(Color("mainExtraLight"))
                        .background(Color("mainExtraLightExtraLow"))
                        .cornerRadius(15)
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
                .sheet(isPresented: $isEditProfilePresented, content: { EditProfileView(isEditProfilePresented: $isEditProfilePresented) })
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Text("")
                        UserResourceView(image: "analysis", text: "profile_analysis", value: viewModel.gameStatus?.analysis ?? 0)
                        
                        UserResourceView(image: "contacts", text: "profile_contacts", value: viewModel.gameStatus?.contacts ?? 0)
                        
                        UserResourceView(image: "addressing", text: "profile_addressing", value: viewModel.gameStatus?.addressing ?? 0)
                        
                        UserResourceView(image: "consulting", text: "profile_consulting", value: viewModel.gameStatus?.consulting ?? 0)
                        
                        UserResourceView(image: "services", text: "profile_services", value: viewModel.gameStatus?.services ?? 0)
                    }
                    .padding(.horizontal, 8)
                }
                
                Divider()
                    .background(Color("mainLow"))
                    .padding(.vertical, 16)
                
                VStack(spacing: 16) {
                    NavigationLink(destination: SkillsView()) {
                        MenuRowView(image: "skills", text: "profile_skills")
                    }
                    
                    NavigationLink(destination: EmptyView()) {
                        MenuRowView(image: "badges", text: "profile_badges")
                    }
                    
                    NavigationLink(destination: EmptyView()) {
                        MenuRowView(image: "overview", text: "profile_my_team")
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
                Color("negative")
            }
            .edgesIgnoringSafeArea(.vertical)
        )
    }
}


//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}
