//
//  MissionListView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 30/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct MissionsListView: View {
    @ObservedObject var viewModel = MissionListViewModel()
    @ObservedObject var dashboardViewModel = DashboardViewModel()
    @Binding var isMissionsListPresented: Bool
    @Binding var missionId: Int
    @Binding var missionImage: String
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(viewModel.missionsPreview ?? []) { mission in
                        
                        // TODO: Add component/subview MissionListRowView
                        // TODO: Add background for selected rows
                        
                        Button {
                            if mission.totalQuests != nil {
                                dashboardViewModel.missionId = mission.id
                                missionId = mission.id ?? 0
                                missionImage = mission.missionType.code ?? ""
                                isMissionsListPresented.toggle()
                            }
                        } label: {
                            if mission.totalQuests != nil {
                                if (self.viewModel.isFinished(totalQuests: mission.totalQuests ?? 0, finishedQuests: mission.finishedQuests ?? 0)) {
                                    HStack {
                                        Text("\(mission.missionType.id ?? 0). ") + Text(mission.title)
                                        Spacer()
                                        Image("ok")
                                    }
                                    .foregroundColor(Color("success"))
                                } else {
                                    HStack {
                                        Text("\(mission.missionType.id ?? 0). ") + Text(mission.title)
                                        Spacer()
                                        Text("\(mission.finishedQuests ?? 0) / \(mission.totalQuests ?? 0)")
                                        Image("finished_quests")
                                    }
                                    .foregroundColor(Color("main"))
                                }
                            } else {
                                HStack {
                                    Text("\(mission.missionType.id ?? 0). \(mission.title)")
                                    Spacer()
                                    Image("lock")
                                }
                                .foregroundColor(Color("disabled"))
                            }
                        }
                        Divider()
                            .background(Color("mainLow"))
                    }
                    Spacer()
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            }.padding()
            .background(Color("negative"))
            .navigationBarTitle(Text("missions_missions_list"), displayMode: .inline)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(trailing: Button(action: {
                isMissionsListPresented.toggle()
            }) {
                Image("cross")
                    .foregroundColor(Color("main"))
            })
        }
    }
}

//struct MissionListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MissionListView()
//    }
//}
