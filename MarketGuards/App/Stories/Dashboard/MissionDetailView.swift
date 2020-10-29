//
//  MissionDetailView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 04/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct MissionDetailView: View {
    @Binding var missionDetail: MissionDetailResponse?
    @Binding var isMissionDetailPresented: Bool
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16){
                    GeometryReader { geometryReader in
                        Image(missionDetail?.missionType?.code ?? "")
                            .resizable()
                            .frame(width: geometryReader.size.width)
                    }.frame(height: 200)
                    
                    Text(missionDetail?.title ?? "")
                        .font(title)
                        .foregroundColor(Color("mainExtraLight"))
                        .padding(.horizontal, 16)
                    
                    Text(missionDetail?.story ?? "")
                        .font(callout)
                        .foregroundColor(Color("main"))
                        .padding(.horizontal, 16)
                }
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .background(Color("negative"))
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(Text("missions_mission_detail"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                isMissionDetailPresented.toggle()
            }) {
                Image("cross")
                    .foregroundColor(Color("main"))
            })
        }
    }
}

//struct MissionDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MissionDetailView()
//    }
//}
