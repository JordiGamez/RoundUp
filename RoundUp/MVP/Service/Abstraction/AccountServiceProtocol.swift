//
//  AccountServiceProtocol.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import Foundation

/// Abstraction for AccountService
protocol AccountServiceProtocol {
    
    /// Get an account holder's bank accounts
    ///
    /// - Parameters:
    ///   - callBack: CustomerAccounts
    func getAccountInformation(callBack: (CustomerAccounts?) -> Void)
    
    /// Gets the account holder's feed items which were created between two timestamps
    ///
    /// - Parameters:
    ///   - accountId: account id
    ///   - categoryId: category id
    ///   - callBack: TransactionItems
    func getTransactions(accountId: String,
                         categoryId: String,
                         callBack: (TransactionItems?) -> Void)
}
