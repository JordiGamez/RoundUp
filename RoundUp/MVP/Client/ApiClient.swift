//
//  ApiClient.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import UIKit

/// Api client
final class ApiClient: BaseClient {}

// MARK: - ApiClientProtocol protocol conformance

extension ApiClient: ApiClientProtocol {

    /// Load customer information
    ///
    /// - Returns: CreditValuesEntity
    /// - Throws: APIException
    func loadCustomerInformation() throws -> CustomerAccounts {
        do {
            if let result = try request(.accounts) {
                if let data = result.data {
                    let decodeResult = try Decoder().decode(
                        CustomerAccounts.self, from: data)
                    return decodeResult
                }
            }
            throw APIException.unknownException
        } catch let exception as APIException {
            throw exception
        }
    }
    
    /// Load account transactions
    ///
    /// - Parameters:
    ///   - accountId: account id
    ///   - categoryId: category id
    /// - Returns: TransactionItems
    /// - Throws: APIException
    func loadAccountTransactions(accountId: String, categoryId: String)
        throws -> TransactionItems {
        do {
            if let result = try request(.transactions(accountId: accountId,
                                                      categoryId: categoryId)) {
                if let data = result.data {
                    let decodeResult = try Decoder().decode(
                        TransactionItems.self, from: data)
                    return decodeResult
                }
            }
            throw APIException.unknownException
        } catch let exception as APIException {
            throw exception
        }
    }
    
    /// Create a savings goal
    ///
    /// - Parameter accountId: account id
    /// - Returns: SavingsGoal
    /// - Throws: APIException
    func createSavingsGoal(accountId: String) throws -> SavingsGoal {
        do {
            if let result = try request(.savingsGoals(accountId: accountId)) {
                if let data = result.data {
                    let decodeResult = try Decoder().decode(
                        SavingsGoal.self, from: data)
                    return decodeResult
                }
            }
            throw APIException.unknownException
        } catch let exception as APIException {
            throw exception
        }
    }
    
    /// Add money into a savings goal
    ///
    /// - Parameters:
    ///   - accountId: account id
    ///   - savingsGoalId: savings goal id
    ///   - money: money value
    /// - Returns: Transfer
    /// - Throws: APIException
    func transferMoneyToSavingsGoal(accountId: String, savingsGoalId: String, money: CGFloat) throws -> Transfer {
        do {
            if let result = try request(.transferMoneyToSavingsGoal(accountId: accountId, savingsGoalId: savingsGoalId, amount: money)) {
                if let data = result.data {
                    let decodeResult = try Decoder().decode(
                        Transfer.self, from: data)
                    return decodeResult
                }
            }
            throw APIException.unknownException
        } catch let exception as APIException {
            throw exception
        }
    }
}
