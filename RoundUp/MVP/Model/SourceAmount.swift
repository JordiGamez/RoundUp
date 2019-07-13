//
//  SourceAmount.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import Foundation

/// SourceAmount
struct SourceAmount: Codable {
    
    // MARK: Public enums
    
    enum CodingKeys: String, CodingKey {
        case currency       = "currency"
        case minorUnits     = "minorUnits"
    }
    
    // MARK: Public variables
    
    var currency: String?
    var minorUnits: Int?
}
