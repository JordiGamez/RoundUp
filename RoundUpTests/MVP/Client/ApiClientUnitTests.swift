//
//  ApiClientUnitTests.swift
//  RoundUpTests
//
//  Created by Jordi Gámez on 14/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import RoundUp

/// ApiClient unit tests
class ApiClientUnitTests: QuickSpec {
    
    // MARK: - Tests
    
    override func spec() {
        
        // MARK: Variables
        
        var apiClient: ApiClient?
        
        // MARK: Tests
        
        beforeEach {
            apiClient = ApiClient()
        }
        describe("when executing the api client loadCustomerInformation method") {
            context("given a valid response from base client") {
                beforeEach {
                    do { _ = try apiClient?.loadCustomerInformation() } catch {}
                }
                it("") {}
            }
        }
        describe("when executing the api client loadAccountTransactions method") {
            context("given a valid response from base client") {
                beforeEach {
                    do { _ = try apiClient?.loadAccountTransactions(accountId: "e29b4464-8d1c-4345-862b-c8f6f2ea8f27", categoryId: "4b9b028f-04db-4229-9fbe-6e1a9425cf34") } catch {}
                }
                it("") {}
            }
        }
//        describe("when executing the api client loadAccountTransactions method") {
//            context("given an invalid response from base client") {
//                beforeEach {
//                    do { _ = try apiClient?.loadAccountTransactions(accountId: "1", categoryId: "1") } catch {}
//                }
//                it("") {}
//            }
//        }
        describe("when executing the api client createSavingsGoal method") {
            context("given a valid response from base client") {
                beforeEach {
                    do { _ = try apiClient?.createSavingsGoal(accountId: "e29b4464-8d1c-4345-862b-c8f6f2ea8f27") } catch {}
                }
                it("") {}
            }
        }
//        describe("when executing the api client createSavingsGoal method") {
//            context("given an invalid response from base client") {
//                beforeEach {
//                    do { _ = try apiClient?.createSavingsGoal(accountId: "1") } catch {}
//                }
//                it("") {}
//            }
//        }
        describe("when executing the api client transferMoneyToSavingsGoal method") {
            context("given a valid response from base client") {
                beforeEach {
                    do { _ = try apiClient?.transferMoneyToSavingsGoal(accountId: "e29b4464-8d1c-4345-862b-c8f6f2ea8f27", savingsGoalId: "c0050be7-06d1-40d3-8113-014b6953658c", money: 1000) } catch {}
                }
                it("") {}
            }
        }
//        describe("when executing the api client transferMoneyToSavingsGoal method") {
//            context("given a valid response from base client") {
//                beforeEach {
//                    do { _ = try apiClient?.transferMoneyToSavingsGoal(accountId: "1", savingsGoalId: "1", money: 1000) } catch {}
//                }
//                it("") {}
//            }
//        }
    }
}
