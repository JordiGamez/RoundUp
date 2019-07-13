//
//  CustomerAccounts.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import Foundation

/// CustomerAccounts
struct CustomerAccounts: Codable {
    
    // MARK: Public enums
    
    enum CodingKeys: String, CodingKey {
        case accounts       = "accounts"
    }
    
    // MARK: Public variables
    
    var accounts: [Account]?
}
