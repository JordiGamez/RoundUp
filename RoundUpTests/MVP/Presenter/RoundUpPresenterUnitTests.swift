//
//  RoundUpPresenterUnitTests.swift
//  RoundUpTests
//
//  Created by Jordi Gámez on 14/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import RoundUp

/// RoundUpPresenter unit tests
class RoundUpPresenterUnitTests: QuickSpec {
    
    // MARK: - Mocks
    
    class MockRoundUpViewController: RoundUpViewControllerProtocol {
        
        var displayTotalSavedAmountIsCalled = false
        var displayTranferSuccessfullyMadeIsCalled = false
        var showErrorIsCalled = false
        var setupViewIsCalled = false
        
        func displayTotalSavedAmount(value: CGFloat) {
            displayTotalSavedAmountIsCalled = true
        }
        
        func displayTranferSuccessfullyMade() {
            displayTranferSuccessfullyMadeIsCalled = true
        }
        
        func showError() {
            showErrorIsCalled = true
        }
        
        func setupView() {
            setupViewIsCalled = true
        }
    }
    
    class MockAccountService: AccountServiceProtocol {
        
        var getAccountInformationIsCalled = false
        var getTransactionsIsCalled = false
        var setSavingsGoalIsCalled = false
        var setTransferMoneyToSavingsGoalIsCalled = false
        var throwsException = false
        
        func getAccountInformation() throws -> CustomerAccounts {
            getAccountInformationIsCalled = true
            if throwsException { throw APIException.unknownException }
            return CustomerAccounts()
        }
        
        func getTransactions(accountId: String, categoryId: String) throws -> TransactionItems {
            getTransactionsIsCalled = true
            if throwsException { throw APIException.unknownException }
            return TransactionItems()
        }
        
        func setSavingsGoal(accountId: String) throws -> SavingsGoal {
            setSavingsGoalIsCalled = true
            if throwsException { throw APIException.unknownException }
            return SavingsGoal(savingsGoalUid: "c0050be7-06d1-40d3-8113-014b6953658c", success: true)
        }
        
        func setTransferMoneyToSavingsGoal(accountId: String, savingsGoalId: String, money: CGFloat) throws -> Transfer {
            setTransferMoneyToSavingsGoalIsCalled = true
            if throwsException { throw APIException.unknownException }
            return Transfer()
        }
    }
    
    // MARK: - Tests
    
    override func spec() {
        
        // MARK: Variables
        
        var presenter: RoundUpPresenter?
        var viewController: MockRoundUpViewController?
        var accountService: MockAccountService?
        
        // MARK: Tests
        
        beforeEach {
            viewController = MockRoundUpViewController()
            accountService = MockAccountService()
            presenter = RoundUpPresenter(accountService: accountService!)
        }
        describe("when binding view with presenter") {
            context("given a valid view protocol") {
                beforeEach {
                    presenter?.bind(view: viewController!)
                }
                it("should bind the view with the presenter") {
                    expect(presenter?.view).to(beAKindOf(RoundUpViewControllerProtocol.self))
                }
            }
        }
        describe("when calling viewDidLoad method") {
            context("given a valid view protocol") {
                beforeEach {
                    presenter?.bind(view: viewController!)
                    presenter?.accountId = "e29b4464-8d1c-4345-862b-c8f6f2ea8f27"
                    presenter?.viewDidLoad()
                }
                it("should call view controller setup method") {
                    expect(viewController?.setupViewIsCalled).to(beTrue())
                }
                it("should call accountService getAccountInformation method") {
                    expect(accountService?.getAccountInformationIsCalled).toEventually(beTrue())
                }
            }
        }
        describe("when calling viewWillAppear method") {
            context("given a valid view protocol") {
                beforeEach {
                    presenter?.bind(view: viewController!)
                    presenter?.viewWillAppear()
                }
                it("should do nothing") {}
            }
        }
        describe("when calling viewDidAppear method") {
            context("given a valid view protocol") {
                beforeEach {
                    presenter?.bind(view: viewController!)
                    presenter?.viewDidAppear()
                }
                it("should do nothing") {}
            }
        }
        describe("when calling viewWillDisappear method") {
            context("given a valid view protocol") {
                beforeEach {
                    presenter?.bind(view: viewController!)
                    presenter?.viewWillDisappear()
                }
                it("should do nothing") {}
            }
        }
        describe("when calling viewDidDisappear method") {
            context("given a valid view protocol") {
                beforeEach {
                    presenter?.bind(view: viewController!)
                    presenter?.viewDidDisappear()
                }
                it("should do nothing") {}
            }
        }
        describe("when calling viewDidDisappear method") {
            context("given a valid view protocol") {
                beforeEach {
                    presenter?.accountService = accountService
                    presenter?.bind(view: viewController!)
                    presenter?.savings = 1000
                    presenter?.accountId = "e29b4464-8d1c-4345-862b-c8f6f2ea8f27"
                    presenter?.savingsGoalId = "c0050be7-06d1-40d3-8113-014b6953658c"
                    presenter?.transferSavings(amount: 1000)
                }
                it("should call accountService setSavingsGoal method") {
                    expect(accountService?.setSavingsGoalIsCalled).toEventually(beTrue())
                }
            }
        }
    }
}
