//
//  ApiClient.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import Foundation

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
}
