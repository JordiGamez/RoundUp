//
//  AccountService.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import UIKit

/// Account service
class AccountService {
    
    // MARK: Public variables
    
    var apiClient: ApiClientProtocol?
    
    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }
}

// MARK: - AccountServiceProtocol protocol conformance

extension AccountService: AccountServiceProtocol {
    
    /// Get an account holder's bank accounts
    ///
    /// - Parameters:
    ///   - callBack: CustomerAccounts
    func getAccountInformation(callBack: (CustomerAccounts?) -> Void) {
        do {
            if let result = try apiClient?.loadCustomerInformation() {
                callBack(result)
            }
            callBack(nil)
        } catch {
            callBack(nil)
        }
    }
    
    /// Gets the account holder's feed items which were created between two timestamps
    ///
    /// - Parameters:
    ///   - accountId: account id
    ///   - categoryId: category id
    ///   - callBack: TransactionItems
    func getTransactions(accountId: String,
                         categoryId: String,
                         callBack: (TransactionItems?) -> Void) {
        do {
            if let result = try apiClient?.loadAccountTransactions(
                accountId: accountId, categoryId: categoryId) {
                callBack(result)
            }
            callBack(nil)
        } catch {
            callBack(nil)
        }
    }
    
    /// Create a savings goal
    ///
    /// - Parameters:
    ///   - accountId: account id
    ///   - callBack: SavingsGoal
    func setSavingsGoal(accountId: String, callBack: (SavingsGoal?) -> Void) {
        do {
            if let result = try apiClient?.createSavingsGoal(accountId: accountId) {
                callBack(result)
            }
            callBack(nil)
        } catch {
            callBack(nil)
        }
    }
    
    /// Add money into a savings goal
    ///
    /// - Parameters:
    ///   - accountId: account id
    ///   - savingsGoalId: savings goal id
    ///   - money: money value
    ///   - callBack: Transfer
    func setTransferMoneyToSavingsGoal(accountId: String, savingsGoalId: String, money: CGFloat, callBack: (Transfer?) -> Void) {
        do {
            if let result = try apiClient?.transferMoneyToSavingsGoal(
                accountId: accountId, savingsGoalId: savingsGoalId, money: money) {
                callBack(result)
            }
            callBack(nil)
        } catch {
            callBack(nil)
        }
    }
}
