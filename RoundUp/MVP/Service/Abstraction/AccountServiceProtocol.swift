//
//  AccountServiceProtocol.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import UIKit

/// Abstraction for AccountService
protocol AccountServiceProtocol {
    
    /// Get an account holder's bank accounts
    ///
    /// - Returns: CustomerAccounts
    /// - Throws: APIException
    func getAccountInformation() throws -> CustomerAccounts
    
    /// Gets the account holder's feed items which were created between two timestamps
    ///
    /// - Parameters:
    ///   - accountId: account id
    ///   - categoryId: category id
    /// - Returns: TransactionItems
    /// - Throws: APIException
    func getTransactions(accountId: String,
                         categoryId: String) throws -> TransactionItems
    
    /// Create a savings goal
    ///
    /// - Parameter accountId: account id
    /// - Returns: SavingsGoal
    /// - Throws: APIException
    func setSavingsGoal(accountId: String) throws -> SavingsGoal
    
    /// Add money into a savings goa
    ///
    /// - Parameters:
    ///   - accountId: account id
    ///   - savingsGoalId: savings goal id
    ///   - money: money value
    /// - Returns: Transfer
    /// - Throws: APIException
    func setTransferMoneyToSavingsGoal(accountId: String, savingsGoalId: String, money: CGFloat) throws -> Transfer
}
