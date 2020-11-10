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
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Button {
                    isMissionListPresented.toggle()
                } label: {
                    Text("missions_choose_mission")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 30.0)
                        .font(.chakraPetchSemiBold(size: 15))
                        .foregroundColor(Color("mainExtraLight"))
                        .background(Color("mainExtraLightExtraLow"))
                        .cornerRadius(15)
                }
                .padding(.top, 8)
                .padding(.bottom, 16)
                .sheet(isPresented: $isMissionListPresented, onDismiss: {viewModel.fetchMissionDetailData(missionId: missionId)}, content: { MissionsListView(isMissionsListPresented: $isMissionListPresented, missionId: $missionId) })
                
                Text(viewModel.missionDetail?.title?.uppercased() ?? "Všechny questy".uppercased())
                    .font(.chakraPetchRegular(size: 34))
                    .foregroundColor(Color("mainExtraLight"))
                
                if viewModel.missionDetail?.id != nil {
                    Text(viewModel.missionDetail?.story ?? "")
                        .font(.chakraPetchRegular(size: 13))
                        .lineLimit(4)
                        .foregroundColor(Color("mainExtraLight"))
                        .opacity(0.6)
                    
                    Button {
                        isMissionDetailPresented.toggle()
                    } label: {
                        Text("missions_show_more")
                            .font(.chakraPetchRegular(size: 13))
                            .foregroundColor(Color("main"))
                            .padding(.top)
                    }
                    .sheet(isPresented: $isMissionDetailPresented, content: { MissionDetailView(missionDetail: $viewModel.missionDetail, isMissionDetailPresented: $isMissionDetailPresented) })
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
                                .font(.chakraPetchBold(size: 12))
                                .foregroundColor(Color("mainExtraLight"))
                                .padding(.bottom)) {
                        ActiveQuestsView(missionDetail: $viewModel.missionDetail)
                    }
                }
                if topIndex == 1 {
                    Section(header: Text("missions_prepared_quests")
                                .font(.chakraPetchBold(size: 12))
                                .foregroundColor(Color("mainExtraLight"))
                                .padding(.bottom)) {
                        PreparedQuestsView(missionDetail: $viewModel.missionDetail)
                    }
                }
                if topIndex == 2 {
                    Section(header:  Text("missions_finished_quests")
                                .font(.chakraPetchBold(size: 12))
                                .foregroundColor(Color("mainExtraLight"))
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
                Color("negative")
            }
            .edgesIgnoringSafeArea(.vertical)
        )
    }
}

//struct DashboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        DashboardView()
//    }
//}
