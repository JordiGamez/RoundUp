//
//  ApiClientProtocol.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import Foundation

/// Abstraction for ApiClient
protocol ApiClientProtocol {
    
    /// Load customer information
    ///
    /// - Returns: CustomerAccounts
    /// - Throws: APIException
    func loadCustomerInformation() throws -> CustomerAccounts
    
    /// Load account transactions
    ///
    /// - Parameters:
    ///   - accountId: account id
    ///   - categoryId: category id
    /// - Returns: TransactionItems
    /// - Throws: APIException
    func loadAccountTransactions(accountId: String, categoryId: String) throws -> TransactionItems
}
