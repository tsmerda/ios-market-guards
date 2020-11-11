//
//  UserProfileView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = UserProfileViewModel()
    @State private var isEditProfilePresented = false
    
    var body: some View {
        ZStack {
            Color("negative")
                .edgesIgnoringSafeArea(.bottom)
            VStack {
                VStack {
                    Image("\("avatar".getFromToken)".lowercased())
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fill)
                        .frame(width:150, height: 150)
                        .overlay(Circle().stroke(Color("mainExtraLightLow")))
                        .padding(.top)
                    
                    Text("firstName".getFromToken)
                        .font(.chakraPetchSemiBold(size: 20))
                        .foregroundColor(Color("mainExtraLight"))
                        .padding(.vertical, 8)
                    
                    Button {
                        isEditProfilePresented.toggle()
                    } label: {
                        Text("profile_edit_profile")
                            .textCase(.uppercase)
                            .font(.chakraPetchMedium(size: 11))
                            .frame(width: 104, height: 22)
                            .foregroundColor(Color("mainExtraLight"))
                            .background(Color("mainExtraLightExtraLow"))
                            .cornerRadius(30)
                    }
                    .padding(.bottom, 40)
                    .sheet(isPresented: $isEditProfilePresented, content: { EditProfileView(isEditProfilePresented: $isEditProfilePresented) })
                    
                    GeometryReader { geometryReader in
                        HStack(spacing: 0) {
                            HStack {
                                Text("profile_level")
                                    .font(.chakraPetchRegular(size: 16))
                                    .foregroundColor(Color("disabled"))
                                
                                Text("\(viewModel.gameStatus?.level ?? 0)")
                                    .font(.chakraPetchBold(size: 16))
                                    .foregroundColor(Color("mainExtraLight"))
                            }
                            .frame(width: geometryReader.size.width/4)
                            
                            HStack {
                                Text("profile_currency")
                                    .font(.chakraPetchRegular(size: 16))
                                    .foregroundColor(Color("disabled"))
                                
                                Text("\(viewModel.gameStatus?.currency ?? 0)")
                                    .font(.chakraPetchBold(size: 16))
                                    .foregroundColor(Color("mainExtraLight"))
                            }
                            .frame(width: geometryReader.size.width/4)
                            
                            HStack {
                                Text("profile_week")
                                    .font(.chakraPetchRegular(size: 16))
                                    .foregroundColor(Color("disabled"))
                                
                                Text("24")
                                    .font(.chakraPetchBold(size: 16))
                                    .foregroundColor(Color("mainExtraLight"))
                            }
                            .frame(width: geometryReader.size.width/4)
                            
                            HStack {
                                Text("profile_region")
                                    .font(.chakraPetchRegular(size: 16))
                                    .foregroundColor(Color("disabled"))
                                
                                Text("3")
                                    .font(.chakraPetchBold(size: 16))
                                    .foregroundColor(Color("mainExtraLight"))
                            }.frame(width: geometryReader.size.width/4)
                        }
                    }
                    .frame(height: 32)
                }
                
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
                .padding(.horizontal, 16)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Text("")
                        UserResourceView(image: "analysis", text: "profile_analysis", value: viewModel.gameStatus?.analysis ?? 0)
                        
                        UserResourceView(image: "contacts", text: "profile_contacts", value: viewModel.gameStatus?.contacts ?? 0)
                        
                        UserResourceView(image: "addressing", text: "profile_addressing", value: viewModel.gameStatus?.addressing ?? 0)
                        
                        UserResourceView(image: "consulting", text: "profile_consulting", value: viewModel.gameStatus?.consulting ?? 0)
                        
                        UserResourceView(image: "services", text: "profile_services", value: viewModel.gameStatus?.services ?? 0)
                    }
                }
                .padding(.horizontal, 8)
                .padding(.top, 16)
                
                Divider()
                    .background(Color("disabled"))
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
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text("profile"), displayMode: .inline)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(Color("mainExtraLight"))
        })
    }
}


//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}
