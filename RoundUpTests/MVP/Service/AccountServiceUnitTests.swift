//
//  AccountServiceUnitTests.swift
//  RoundUpTests
//
//  Created by Jordi Gámez on 14/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import RoundUp

/// AccountService unit tests
class AccountServiceUnitTests: QuickSpec {
    
    // MARK: - Mocks
    
    class MockApiClient: ApiClientProtocol {
        
        var loadCustomerInformationIsCalled = false
        var loadAccountTransactionsnIsCalled = false
        var createSavingsGoalIsCalled = false
        var transferMoneyToSavingsGoalIsCalled = false
        var throwsException = false
        
        func loadCustomerInformation() throws -> CustomerAccounts {
            loadCustomerInformationIsCalled = true
            if throwsException { throw APIException.unknownException }
            return CustomerAccounts()
        }
        
        func loadAccountTransactions(accountId: String, categoryId: String) throws -> TransactionItems {
            loadAccountTransactionsnIsCalled = true
            if throwsException { throw APIException.unknownException }
            return TransactionItems()
        }
        
        func createSavingsGoal(accountId: String) throws -> SavingsGoal {
            createSavingsGoalIsCalled = true
            if throwsException { throw APIException.unknownException }
            return SavingsGoal()
        }
        
        func transferMoneyToSavingsGoal(accountId: String, savingsGoalId: String, money: CGFloat) throws -> Transfer {
            transferMoneyToSavingsGoalIsCalled = true
            if throwsException { throw APIException.unknownException }
            return Transfer()
        }
    }
    
    // MARK: - Tests
    
    override func spec() {
        
        // MARK: Variables
        
        var accountService: AccountService?
        var apiClient: MockApiClient?
        
        // MARK: Tests
        
        beforeEach {
            apiClient = MockApiClient()
            accountService = AccountService(apiClient: apiClient!)
        }
        describe("when executing the account service getAccountInformation method") {
            context("given a valid response from base client") {
                beforeEach {
                    accountService?.apiClient = apiClient
                    do { _ = try accountService?.getAccountInformation() } catch {}
                }
                it("should call apiClient getAccountInformation method") {
                    expect(apiClient?.loadCustomerInformationIsCalled).to(beTrue())
                }
            }
        }
        describe("when executing the account service getAccountInformation method") {
            context("given an exception response from api client") {
                beforeEach {
                    apiClient?.throwsException = true
                    accountService?.apiClient = apiClient
                    do { _ = try accountService?.getAccountInformation() } catch {}
                }
                it("should call apiClient getAccountInformation method") {
                    expect(apiClient?.loadCustomerInformationIsCalled).to(beTrue())
                }
                it("should throw unknownException from apiClient") {
                    expect { try apiClient?.loadCustomerInformation() }.to(throwError())
                }
            }
        }
        describe("when executing the account service getTransactions method") {
            context("given an exception response from api client") {
                beforeEach {
                    accountService?.apiClient = apiClient
                    do { _ = try accountService?.getTransactions(accountId: "e29b4464-8d1c-4345-862b-c8f6f2ea8f27", categoryId: "4b9b028f-04db-4229-9fbe-6e1a9425cf34") } catch {}
                }
                it("should call apiClient loadAccountTransactions method") {
                    expect(apiClient?.loadAccountTransactionsnIsCalled).to(beTrue())
                }
            }
        }
        describe("when executing the account service getTransactions method") {
            context("given an exception response from api client") {
                beforeEach {
                    apiClient?.throwsException = true
                    accountService?.apiClient = apiClient
                    do { _ = try accountService?.getTransactions(accountId: "e29b4464-8d1c-4345-862b-c8f6f2ea8f27", categoryId: "4b9b028f-04db-4229-9fbe-6e1a9425cf34") } catch {}
                }
                it("should call apiClient loadAccountTransactions method") {
                    expect(apiClient?.loadAccountTransactionsnIsCalled).to(beTrue())
                }
                it("should throw unknownException from apiClient") {
                    expect { try apiClient?.loadAccountTransactions(accountId: "e29b4464-8d1c-4345-862b-c8f6f2ea8f27", categoryId: "4b9b028f-04db-4229-9fbe-6e1a9425cf34") }.to(throwError())
                }
            }
        }
        describe("when executing the account service setSavingsGoal method") {
            context("given an exception response from api client") {
                beforeEach {
                    accountService?.apiClient = apiClient
                    do { _ = try accountService?.setSavingsGoal(accountId: "e29b4464-8d1c-4345-862b-c8f6f2ea8f27") } catch {}
                }
                it("should call apiClient createSavingsGoal method") {
                    expect(apiClient?.createSavingsGoalIsCalled).to(beTrue())
                }
            }
        }
        describe("when executing the account service setSavingsGoal method") {
            context("given an exception response from api client") {
                beforeEach {
                    apiClient?.throwsException = true
                    accountService?.apiClient = apiClient
                    do { _ = try accountService?.setSavingsGoal(accountId: "e29b4464-8d1c-4345-862b-c8f6f2ea8f27") } catch {}
                }
                it("should call apiClient createSavingsGoal method") {
                    expect(apiClient?.createSavingsGoalIsCalled).to(beTrue())
                }
                it("should throw unknownException from apiClient") {
                    expect { try apiClient?.createSavingsGoal(accountId: "e29b4464-8d1c-4345-862b-c8f6f2ea8f27") }.to(throwError())
                }
            }
        }
        describe("when executing the account service setSavingsGoal method") {
            context("given an exception response from api client") {
                beforeEach {
                    accountService?.apiClient = apiClient
                    do { _ = try accountService?.setTransferMoneyToSavingsGoal(accountId: "e29b4464-8d1c-4345-862b-c8f6f2ea8f27", savingsGoalId: "c0050be7-06d1-40d3-8113-014b6953658c", money: 1000) } catch {}
                }
                it("should call apiClient transferMoneyToSavingsGoal method") {
                    expect(apiClient?.transferMoneyToSavingsGoalIsCalled).to(beTrue())
                }
            }
        }
        describe("when executing the account service setTransferMoneyToSavingsGoal method") {
            context("given an exception response from api client") {
                beforeEach {
                    apiClient?.throwsException = true
                    accountService?.apiClient = apiClient
                    do { _ = try accountService?.setTransferMoneyToSavingsGoal(accountId: "e29b4464-8d1c-4345-862b-c8f6f2ea8f27", savingsGoalId: "c0050be7-06d1-40d3-8113-014b6953658c", money: 1000) } catch {}
                }
                it("should call apiClient transferMoneyToSavingsGoal method") {
                    expect(apiClient?.transferMoneyToSavingsGoalIsCalled).to(beTrue())
                }
                it("should throw unknownException from apiClient") {
                    expect { try apiClient?.transferMoneyToSavingsGoal(accountId: "e29b4464-8d1c-4345-862b-c8f6f2ea8f27", savingsGoalId: "c0050be7-06d1-40d3-8113-014b6953658c", money: 1000) }.to(throwError())
                }
            }
        }
    }
}
