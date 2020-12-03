//
//  StoreViewModel.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 29.11.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

struct StoreItem: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var price: Int
    var left: Int
    var count: Int
}

class StoreViewModel: ObservableObject {
    @Published var StoreList: [StoreItem] = []
    @Published var StoreListBought: [StoreItem] = []
    
    func buyReward(item: StoreItem) {
        self.StoreListBought.append(item)
    }
    
    init() {
        self.StoreList = [
            StoreItem(image: "reward", title: "Káva/Čaj s ředitelem sítě", text: "Pozvání na kávu nebo čaj od ředitele obchodní sítě (T5 a výš) dle vlastní volby.", price: 50, left: 6, count: 20),
            StoreItem(image: "reward", title: "Sleva 10% do OE Shopu", text: "10% sleva na 1 celý nákup v Optimal Shopu.", price: 20, left: 2, count: 10),
            StoreItem(image: "reward", title: "Aktualizační seminář 50% sleva", text: "50% sleva na Aktualizační seminář (základní cena bez přespání).", price: 30, left: 3, count: 10),
            StoreItem(image: "reward", title: "Káva/Čaj s ředitelem sítě", text: "Pozvání na kávu nebo čaj od ředitele obchodní sítě (T5 a výš) dle vlastní volby.", price: 15, left: 6, count: 45),
            StoreItem(image: "reward", title: "Brian Tracy: Jak mnohem lépe prodávat", text: "Podstatný rozdíl mezi touto knihou a návody na prodejní úspěch spočívá v tom, že se vyhýbá klišé, pěkně...", price: 15, left: 6, count: 45)
        ]
    }
}
