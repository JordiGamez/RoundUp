//
//  Transfer.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import Foundation

/// Transfer
struct Transfer: Codable {
    
    // MARK: Public enums
    
    enum CodingKeys: String, CodingKey {
        case transferUid        = "transferUid"
        case success            = "success"
    }
    
    // MARK: Public variables
    
    var transferUid: String?
    var success: Bool?
}
