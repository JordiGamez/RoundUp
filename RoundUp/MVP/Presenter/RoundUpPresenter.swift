//
//  RoundUpPresenter.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import UIKit

/// RoundUpPresenter
final class RoundUpPresenter {
    
    // MARK: Public variables
    
    var view: RoundUpViewControllerProtocol?
    var accountService: AccountServiceProtocol?
    var accountId: String? = nil
    var savings: CGFloat = 0
    var savingsGoalId: String? = nil
    
    // MARK: Initializers
    
    init(accountService: AccountServiceProtocol) {
        self.accountService = accountService
    }
    
    // MARK: Private methods
    
    /// Load weekly savings
    private func loadWeeklySavings() {
        loadAccountInformation()
    }
    
    /// Load account information
    private func loadAccountInformation() {
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                if let result = try self.accountService?.getAccountInformation() {
                    if let accounts = result.accounts {
                        for account in accounts {
                            if let accountId = account.accountUid,
                                let categoryId = account.defaultCategory {
                                self.accountId = accountId
                                self.loadTransactions(accountId: accountId,
                                                       categoryId: categoryId)
                                return
                            }
                        }
                    }
                }
                self.showError()
            } catch {
                self.showError()
            }
        }
    }
    
    /// Load transactions
    ///
    /// - Parameters:
    ///   - accountId: Account id
    ///   - categoryId: Category id (default category id)
    private func loadTransactions(accountId: String, categoryId: String) {
        do {
            if let result = try self.accountService?.getTransactions(accountId: accountId, categoryId: categoryId) {
                if let items = result.feedItems {
                    for transaction in items {
                        if let amount = transaction.amount {
                            let value = CGFloat(amount.minorUnits!) / 10
                            let savedValue = value.rounded(.up) - value
                            savings += savedValue.rounded(toPlaces: 2)
                        }
                    }
                    DispatchQueue.main.async {
                        self.view?.displayTotalSavedAmount(value: self.savings)
                    }
                    return
                }
            }
            self.showError()
        } catch {
            self.showError()
        }
    }
    
    /// Create a savings goal
    private func createSavingsGoal() {
        DispatchQueue.global(qos: .userInitiated).async {
            if let accountId = self.accountId {
                do {
                    if let result = try self.accountService?.setSavingsGoal(accountId: accountId) {
                        if let savingsGoalUid = result.savingsGoalUid {
                            self.savingsGoalId = savingsGoalUid
                            self.transferMoneyToSavingsGoal()
                            return
                        }
                    }
                    self.showError()
                } catch {
                    self.showError()
                }
            } else {
                self.showError()
            }
        }
    }
    
    /// Transfer money to savings goal
    private func transferMoneyToSavingsGoal() {
        if let accountId = accountId, let savingsGoalId = savingsGoalId {
            if savings > 0 {
                do {
                    if try self.accountService?.setTransferMoneyToSavingsGoal(accountId: accountId, savingsGoalId: savingsGoalId, money: savings) != nil {
                        DispatchQueue.main.async {
                            self.view?.displayTranferSuccessfullyMade()
                        }
                    }
                } catch {
                    self.showError()
                }
            } else {
                showError()
            }
        } else {
            showError()
        }
    }
    
    /// Show error
    private func showError() {
        DispatchQueue.main.async {
            self.view?.showError()
        }
    }
}

// MARK: - RoundUpPresenterProtocol protocol conformance

extension RoundUpPresenter: RoundUpPresenterProtocol {
    
    /// Tells the presenter that the view has loaded
    func viewDidLoad() {
        view?.setupView()
        loadWeeklySavings()
    }
    
    /// Tells the presenter that the view will appear
    func viewWillAppear() {
        // Do nothing
    }
    
    /// Tells the presenter that the view has appeared
    func viewDidAppear() {
        // Do nothing
    }
    
    /// Tells the presenter that the view will disappear
    func viewWillDisappear() {
        // Do nothing
    }
    
    /// Tells the presenter that the view has disappeared
    func viewDidDisappear() {
        // Do nothing
    }
    
    /// Bind the view with the presenter
    ///
    /// - Parameter view: RoundUpViewControllerProtocol object
    func bind(view: RoundUpViewControllerProtocol) {
        self.view = view
    }
    
    /// Transfer savings to a saving acount
    ///
    /// - Parameter amount: Amount to transfer
    func transferSavings(amount: CGFloat) {
        createSavingsGoal()
    }
}
