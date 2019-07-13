//
//  ApiClientProtocol.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import UIKit

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
    
    /// Create a savings goal
    ///
    /// - Parameters:
    ///   - accountId: account id
    /// - Returns: SavingsGoal
    /// - Throws: APIException
    func createSavingsGoal(accountId: String) throws -> SavingsGoal
    
    /// Add money into a savings goal
    ///
    /// - Parameters:
    ///   - accountId: account id
    ///   - savingsGoalId: savings goal id
    ///   - money: money value
    /// - Returns: Transfer
    /// - Throws: APIException
    func transferMoneyToSavingsGoal(accountId: String, savingsGoalId: String, money: CGFloat) throws -> Transfer
}
