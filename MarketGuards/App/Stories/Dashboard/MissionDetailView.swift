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
                        .font(.chakraPetchRegular(size: 26))
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                        .padding(.horizontal, 16)
                    
                    Text(missionDetail?.story ?? "")
                        .font(.chakraPetchRegular(size: 16))
                        .foregroundColor(Color(ColorsConstants.main))
                        .padding(.horizontal, 16)
                }
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .background(Color(ColorsConstants.negative))
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(Text("missions_mission_detail"), displayMode: .inline)
            .navigationBarItems(trailing: Button {
                isMissionDetailPresented.toggle()
            } label: {
                Text("done")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(ColorsConstants.mainExtraLight))
            })
        }
    }
}

//struct MissionDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MissionDetailView()
//    }
//}
