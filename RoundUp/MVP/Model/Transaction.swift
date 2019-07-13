//
//  Transaction.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import Foundation

/// Transaction
struct Transaction: Codable {
    
    // MARK: Public enums
    
    enum CodingKeys: String, CodingKey {
        case feedItemUid                            = "feedItemUid"
        case categoryUid                            = "categoryUid"
        case amount                                 = "amount"
        case sourceAmount                           = "sourceAmount"
        case direction                              = "direction"
        case updatedAt                              = "updatedAt"
        case transactionTime                        = "transactionTime"
        case settlementTime                         = "settlementTime"
        case source                                 = "source"
        case sourceSubType                          = "sourceSubType"
        case status                                 = "status"
        case counterPartyType                       = "counterPartyType"
        case counterPartyUid                        = "counterPartyUid"
        case counterPartyName                       = "counterPartyName"
        case counterPartySubEntityUid               = "counterPartySubEntityUid"
        case counterPartySubEntityName              = "counterPartySubEntityName"
        case counterPartySubEntityIdentifier        = "counterPartySubEntityIdentifier"
        case counterPartySubEntitySubIdentifier     = "counterPartySubEntitySubIdentifier"
        case reference                              = "reference"
        case country                                = "country"
        case spendingCategory                       = "spendingCategory"
        case userNote                               = "userNote"
    }
    
    // MARK: Public variables
    
    var feedItemUid: String?
    var categoryUid: String?
    var amount: Amount?
    var sourceAmount: SourceAmount?
    var direction: String?
    var updatedAt: String?
    var transactionTime: String?
    var settlementTime: String?
    var source: String?
    var sourceSubType: String?
    var status: String?
    var counterPartyType: String?
    var counterPartyUid: String?
    var counterPartyName: String?
    var counterPartySubEntityUid: String?
    var counterPartySubEntityName: String?
    var counterPartySubEntityIdentifier: String?
    var counterPartySubEntitySubIdentifier: String?
    var reference: String?
    var country: String?
    var spendingCategory: String?
    var userNote: String?
}
