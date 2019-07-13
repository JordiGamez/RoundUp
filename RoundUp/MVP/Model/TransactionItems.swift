//
//  TransactionItems.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import Foundation

/// TransactionItems
struct TransactionItems: Codable {
    
    // MARK: Public enums
    
    enum CodingKeys: String, CodingKey {
        case feedItems       = "feedItems"
    }
    
    // MARK: Public variables
    
    var feedItems: [Transaction]?
}
