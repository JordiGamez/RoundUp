//
//  Account.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import Foundation

/// Account
struct Account: Codable {
    
    // MARK: Public enums
    
    enum CodingKeys: String, CodingKey {
        case accountUid         = "accountUid"
        case defaultCategory    = "defaultCategory"
        case currency           = "currency"
        case createdAt          = "createdAt"
    }
    
    // MARK: Public variables
    
    var accountUid: String?
    var defaultCategory: String?
    var currency: String?
    var createdAt: String?
}
