//
//  StoreViewModel.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 29.11.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins

class StoreViewModel: ObservableObject {
    @Published var StoreList: [StoreItem] = []
    @Published var currency: Int = 1000
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    init() {
        self.StoreList = [
            StoreItem(image: "reward", title: "Káva/Čaj s ředitelem sítě", text: "Pozvání na kávu nebo čaj od ředitele obchodní sítě (T5 a výš) dle vlastní volby.", price: 50, bought: 1),
            StoreItem(image: "reward", title: "Sleva 10% do OE Shopu", text: "10% sleva na 1 celý nákup v Optimal Shopu.", price: 20, bought: 2),
            StoreItem(image: "reward", title: "Aktualizační seminář 50% sleva", text: "50% sleva na Aktualizační seminář (základní cena bez přespání).", price: 30, bought: 0),
            StoreItem(image: "reward", title: "Káva/Čaj s ředitelem sítě", text: "Pozvání na kávu nebo čaj od ředitele obchodní sítě (T5 a výš) dle vlastní volby.", price: 15, bought: 0),
            StoreItem(image: "reward", title: "Brian Tracy: Jak mnohem lépe prodávat", text: "Podstatný rozdíl mezi touto knihou a návody na prodejní úspěch spočívá v tom, že se vyhýbá klišé, pěkně...", price: 15, bought: 0)
        ]
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
