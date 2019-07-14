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
    /// - Returns: CustomerAccounts
    /// - Throws: APIException
    func getAccountInformation() throws -> CustomerAccounts {
        do {
            if let result = try apiClient?.loadCustomerInformation() {
                return result
            }
            throw APIException.unknownException
        } catch let exception {
            throw exception
        }
    }
    
    /// Gets the account holder's feed items which were created between two timestamps
    ///
    /// - Parameters:
    ///   - accountId: account id
    ///   - categoryId: category id
    /// - Returns: TransactionItems
    /// - Throws: APIException
    func getTransactions(accountId: String,
                         categoryId: String) throws -> TransactionItems {
        do {
            if let result = try apiClient?.loadAccountTransactions(accountId: accountId, categoryId: categoryId) {
                return result
            }
            throw APIException.unknownException
        } catch let exception {
            throw exception
        }
    }
    
    /// Create a savings goal
    ///
    /// - Parameter accountId: account id
    /// - Returns: SavingsGoal
    /// - Throws: APIException
    func setSavingsGoal(accountId: String) throws -> SavingsGoal {
        do {
            if let result = try apiClient?.createSavingsGoal(accountId: accountId) {
                return result
            }
            throw APIException.unknownException
        } catch let exception {
            throw exception
        }
    }
    
    /// Add money into a savings goa
    ///
    /// - Parameters:
    ///   - accountId: account id
    ///   - savingsGoalId: savings goal id
    ///   - money: money value
    /// - Returns: Transfer
    /// - Throws: APIException
    func setTransferMoneyToSavingsGoal(accountId: String, savingsGoalId: String, money: CGFloat) throws -> Transfer {
        do {
            if let result = try apiClient?.transferMoneyToSavingsGoal(accountId: accountId, savingsGoalId: savingsGoalId, money: money) {
                return result
            }
            throw APIException.unknownException
        } catch let exception {
            throw exception
        }
    }
}
