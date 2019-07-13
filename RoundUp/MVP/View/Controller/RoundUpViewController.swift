//
//  RoundUpViewController.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import UIKit

/// RoundUp screen
class RoundUpViewController: BaseViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var totalSavingsLabel: UILabel! {
        didSet {
            totalSavingsLabel.text = "Your current weekly savings are"
        }
    }
    @IBOutlet weak var totalSavingsValueLabel: UILabel!
    @IBOutlet weak var transferSavingsButton: UIButton! {
        didSet {
            transferSavingsButton.backgroundColor = .magenta
            transferSavingsButton.setTitle("Transfer money", for: .normal)
            transferSavingsButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
            transferSavingsButton.layer.cornerRadius = 6
            transferSavingsButton.tintColor = .white
        }
    }
    
    // MARK: Public variables
    
    var presenter: RoundUpPresenterProtocol? =
        RoundUpPresenter(accountService: AccountService(apiClient: ApiClient()))
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindPresenter()
        presenter?.viewDidLoad()
    }
    
    // MARK: Private methods
    
    /// Bind the view with the presenter
    private func bindPresenter() {
        presenter?.bind(view: self)
    }
}

// MARK: - RoundUpViewControllerProtocol protocol conformance

extension RoundUpViewController: RoundUpViewControllerProtocol {
    
    /// Setup current view
    func setupView() {
        view.backgroundColor = .white
    }
    
    /// Display the total saved amount
    ///
    /// - Parameter value: amount in CGFloat format
    func displayTotalSavedAmount(value: CGFloat) {
        totalSavingsValueLabel.text = "£" + value.description
    }
    
    /// Show error
    func showError() {
        // Implement
    }
}
