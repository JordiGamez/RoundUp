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
        accountService?.getAccountInformation() { [weak self] accountInformation in
            if let accountInformation = accountInformation {
                if let accounts = accountInformation.accounts {
                    for account in accounts {
                        if let accountId = account.accountUid,
                            let categoryId = account.defaultCategory {
                            loadTransactions(accountId: accountId,
                                             categoryId: categoryId)
                        } else {
                            self?.showError()
                        }
                    }
                } else {
                    self?.showError()
                }
            } else {
                self?.showError()
            }
        }
    }
    
    /// Load transactions
    ///
    /// - Parameters:
    ///   - accountId: Account id
    ///   - categoryId: Category id (default category id)
    private func loadTransactions(accountId: String, categoryId: String) {
        accountService?.getTransactions(accountId: accountId, categoryId: categoryId) { [weak self] transactions in
            var totalSaved: CGFloat = 0
            if let transactions = transactions {
                if let items = transactions.feedItems {
                    for transaction in items {
                        if let amount = transaction.amount {
                            let value = CGFloat(amount.minorUnits!) / 10
                            let savedValue = value.rounded(.up) - value
                            totalSaved += savedValue.rounded(toPlaces: 2)
                        }
                    }
                    self?.view?.displayTotalSavedAmount(value: totalSaved)
                } else {
                    self?.showError()
                }
            } else {
                self?.showError()
            }
        }
    }
    
    /// Show error
    private func showError() {
        view?.showError()
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
}
