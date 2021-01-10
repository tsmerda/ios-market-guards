//
//  MissionListView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 30/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct MissionsListView: View {
    @StateObject var viewModel = MissionListViewModel()
    @Binding var isMissionsListPresented: Bool
    @Binding var missionId: Int
    
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    missionId = 0
                    isMissionsListPresented.toggle()
                } label: {
                    HStack {
                        Text("missions_all_quests")
                        Spacer()
                        Text("\(viewModel.finishedQuestsCount()) / \(viewModel.totalQuestsCount())")
                        Image("remaining_time")
                    }
                    .font(.chakraPetchRegular(size: 16))
                    .foregroundColor(Color(ColorsConstants.main))
                }
                .padding(.bottom, 8)
                
                Divider()
                    .background(Color(ColorsConstants.mainExtraLow))
                Divider()
                    .background(Color(ColorsConstants.mainExtraLow))
                    .padding(.bottom, 2)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 12) {
                        ForEach(viewModel.missionsPreview ?? []) { mission in
                            // TODO: Add sign / background for selected rows (NICE TO HAVE)
                            Button {
                                if mission.totalQuests != nil {
                                    missionId = mission.id ?? 0
                                    isMissionsListPresented.toggle()
                                }
                            } label: {
                                MissionRow(title: "\(mission.missionType.id ?? 0). \(mission.title)", totalQuests: mission.totalQuests ?? 0, finishedQuests: mission.finishedQuests ?? 0)
                            }
                            Divider()
                                .background(Color(ColorsConstants.mainExtraLow))
                        }
                    }
                    Spacer()
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            }
            .padding()
            .background(Color(ColorsConstants.negative))
            .navigationBarTitle(Text("missions_missions_list"), displayMode: .inline)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(trailing: Button {
                isMissionsListPresented.toggle()
            } label: {
                Text("done")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
            })
        }
    }
}

//struct MissionListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MissionListView()
//    }
//}
