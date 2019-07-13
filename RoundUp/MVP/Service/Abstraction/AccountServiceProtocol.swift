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
    
    /// Create a savings goal
    ///
    /// - Parameters:
    ///   - accountId: account id
    ///   - callBack: SavingsGoal
    func setSavingsGoal(accountId: String, callBack: (SavingsGoal?) -> Void)
    
    /// Add money into a savings goa
    ///
    /// - Parameters:
    ///   - accountId: account id
    ///   - savingsGoalId: savings goal id
    ///   - money: money value
    ///   - callBack: Transfer
    func setTransferMoneyToSavingsGoal(accountId: String, savingsGoalId: String, money: CGFloat, callBack: (Transfer?) -> Void)
}
