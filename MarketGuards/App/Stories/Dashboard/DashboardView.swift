//
//  DashboardView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 27/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
    @State var topIndex = 0
    @ObservedObject var viewModel = DashboardViewModel()
    @State private var isMissionListPresented = false
    @State private var isMissionDetailPresented = false
    @State private var missionImage = ""
    @State private var missionId = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Button {
                        isMissionListPresented.toggle()
                    } label: {
                        Image("burger_menu")
                            .resizable()
                            .foregroundColor(Color("mainExtraLight"))
                            .frame(width: 36.0, height: 36.0)
                            .padding(8)
                            .background(Color("negativeSemi").opacity(0.5))
                            .clipShape(Circle())
                    }
                    .sheet(isPresented: $isMissionListPresented, onDismiss: {viewModel.fetchMissionDetailData(missionId: missionId)}, content: { MissionsListView(isMissionsListPresented: $isMissionListPresented, missionId: $missionId, missionImage: $missionImage) })
                    
                    Spacer()
                    
                    Button {
                        // self.isUserViewPresented = true
                    } label: {
                        Image("user")
                            .resizable()
                            .foregroundColor(Color("mainExtraLight"))
                            .frame(width: 36.0, height: 36.0)
                            .padding(8)
                            .background(Color("negativeSemi").opacity(0.5))
                            .clipShape(Circle())
                    }
                    // .sheet(isPresented: $isUserViewPresented, content: { UserProfileView(isUserViewPresented: self.$isUserViewPresented) })
                }
                .padding(.bottom, 16)
                
                Text(viewModel.missionDetail?.title ?? "Všechny questy")
                    .font(.system(size: 32, weight: .light))
                    .foregroundColor(Color("mainExtraLight"))
                
                if viewModel.missionDetail?.id != nil {
                    Text(viewModel.missionDetail?.story ?? "")
                        .lineLimit(2)
                        .font(.system(size: 16, weight: .light))
                        .foregroundColor(Color("mainExtraLight"))
                        .opacity(0.6)
                    
                    Button(action: {
                        isMissionDetailPresented.toggle()
                    }) {
                        HStack {
                            Text("missions_show_more")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(Color("mainExtraLight"))
                                .padding(.horizontal, 24.0)
                                .padding(.vertical, 8)
                                .background(Color("mainExtraLightExtraLow"))
                                .cornerRadius(30)
                        }
                    }
                    .padding(.top, 16)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .sheet(isPresented: $isMissionDetailPresented, content: { MissionDetailView(missionDetail: $viewModel.missionDetail, isMissionDetailPresented: $isMissionDetailPresented, missionImage: $missionImage) })
                }
                
                Divider()
                    .background(Color("mainExtraLightLow"))
                    .padding(.vertical)
                
                HStack {
                    ForEach(0..<MenuType.dashboard.topMenu.count) { menu in
                        TopMenu(menu: menu, index: $topIndex, menuType: MenuType.dashboard)
                    }
                }
                .padding(.bottom, 32)
                
                if topIndex == 0 {
                    Section(header: Text("missions_active_quests")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(Color("mainExtraLight"))
                                .padding(.bottom)) {
                        ActiveQuestsView(missionDetail: $viewModel.missionDetail)
                    }
                }
                if topIndex == 1 {
                    Section(header: Text("missions_prepared_quests")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(Color("mainExtraLight"))
                                .padding(.bottom)) {
                        PreparedQuestsView(missionDetail: $viewModel.missionDetail)
                    }
                }
                if topIndex == 2 {
                    Section(header:  Text("missions_finished_quests")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(Color("mainExtraLight"))
                                .padding(.bottom)) {
                        FinishedQuestsView(missionDetail: $viewModel.missionDetail)
                    }
                }
            }
            .padding(16)
        }
        .background(
            ZStack {
                Color("negative")
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.vertical)
        )
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
