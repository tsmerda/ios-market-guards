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
    @StateObject var viewModel = DashboardViewModel()
    @State private var isMissionListPresented = false
    @State private var isMissionDetailPresented = false
    @State private var missionId: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text(viewModel.missionDetail?.title?.uppercased() ?? "Všechny questy".uppercased())
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.chakraPetchRegular(size: 34))
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                        .padding(.top)
                    
                    if viewModel.missionDetail?.id != nil {
                        Text(viewModel.missionDetail?.story ?? "")
                            .font(.chakraPetchRegular(size: 13))
                            .lineLimit(4)
                            .foregroundColor(Color(ColorsConstants.mainExtraLight))
                            .opacity(0.6)
                        
                        Button {
                            isMissionDetailPresented.toggle()
                        } label: {
                            Text("missions_show_more")
                                .font(.chakraPetchRegular(size: 13))
                                .foregroundColor(Color(ColorsConstants.main))
                                .padding(.top)
                        }
                        .sheet(isPresented: $isMissionDetailPresented, content: { MissionDetailView(missionDetail: $viewModel.missionDetail, isMissionDetailPresented: $isMissionDetailPresented) })
                    }
                    
                    Divider()
                        .background(Color(ColorsConstants.mainExtraLow))
                        .padding(.vertical)
                    
                    HStack {
                        ForEach(0..<MenuType.dashboard.topMenu.count) { menu in
                            TopMenu(menu: menu, index: $topIndex, menuType: MenuType.dashboard)
                        }
                    }
                    .padding(.bottom, 32)
                    
                    if topIndex == 0 {
                        Section(header: Text("missions_active_quests")
                                    .font(.chakraPetchBold(size: 12))
                                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
                                    .padding(.bottom)) {
                            ActiveQuestsView(missionDetail: $viewModel.missionDetail)
                        }
                    }
                    if topIndex == 1 {
                        Section(header:  Text("missions_finished_quests")
                                    .font(.chakraPetchBold(size: 12))
                                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
                                    .padding(.bottom)) {
                            FinishedQuestsView(missionDetail: $viewModel.missionDetail)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .onAppear() {
                viewModel.fetchMissionDetailData(missionId: missionId)
            }
            .background(
                ZStack {
                    Color(ColorsConstants.negative)
                }
                .edgesIgnoringSafeArea(.vertical)
            )
            
            Button {
                isMissionListPresented.toggle()
            } label: {
                HStack(spacing: 0) {
                    Image("burger_menu_full")
                    Text("missions_choose_mission")
                        .font(.chakraPetchSemiBold(size: 15))
                }
                .padding(.init(top: 0, leading: 4, bottom: 0, trailing: 12))
                .foregroundColor(Color(ColorsConstants.negative))
                .background(Color(ColorsConstants.mainExtraLight).opacity(0.9))
                .cornerRadius(50)
                .padding()
            }
            .sheet(isPresented: $isMissionListPresented, onDismiss: {viewModel.fetchMissionDetailData(missionId: missionId)}, content: { MissionsListView(isMissionsListPresented: $isMissionListPresented, missionId: $missionId) })
        }
    }
}

//struct DashboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        DashboardView()
//    }
//}
