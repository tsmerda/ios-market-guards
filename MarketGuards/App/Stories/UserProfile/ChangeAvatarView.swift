//
//  ChangeAvatarView.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 02/11/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import SwiftUI

struct ChangeAvatarView: View {
    @Binding var isChangeAvatarPresented: Bool
    @Binding var avatar: String
    
    var body: some View {
        NavigationView {
            GeometryReader { geometryReader in
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(1..<7) { index in
                            HStack(spacing: 0) {
                                Button {
                                    avatar = "MAN_\(index)"
                                    isChangeAvatarPresented.toggle()
                                } label: {
                                    AvatarView(avatar: "man_\(index)")
                                }
                                
                                Button {
                                    avatar = "WOMAN_\(index)"
                                    isChangeAvatarPresented.toggle()
                                } label: {
                                    AvatarView(avatar: "woman_\(index)")
                                }
                            }
                        }
                        Spacer()
                    }
                }
                .background(Color(ColorsConstants.negative))
                .edgesIgnoringSafeArea(.bottom)
                .navigationBarTitle(Text("Vybrat avatara"), displayMode: .inline)
                .navigationBarItems(leading: Button {
                    isChangeAvatarPresented.toggle()
                } label: {
                    Text("cancel")
                        .font(.chakraPetchMedium(size: 14))
                        .foregroundColor(Color(ColorsConstants.mainExtraLight))
                })
            }
        }
    }
}

//struct ChangeAvatarView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChangeAvatarView()
//    }
//}
