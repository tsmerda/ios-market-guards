//
//  String+Encrypting.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 27/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation
import CryptoKit

extension String {
    var sha256: String {
        guard let stringData = self.data(using: .utf8) else { return self }
        let hashed = SHA256.hash(data: stringData)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
}
