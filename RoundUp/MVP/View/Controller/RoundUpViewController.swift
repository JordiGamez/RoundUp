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
            totalSavingsLabel.text = "roundUp_currentWeeklySavings".localize()
        }
    }
    @IBOutlet weak var totalSavingsValueLabel: UILabel! {
        didSet {
            totalSavingsValueLabel.isHidden = true
            totalSavingsValueLabel.text = "£0"
        }
    }
    @IBOutlet weak var transferSavingsButton: UIButton! {
        didSet {
            transferSavingsButton.backgroundColor = UIColor(red: 110/255, green: 47/255, blue: 212/255, alpha: 1.0)
            transferSavingsButton.setTitle("roundUp_transferMoney".localize(), for: .normal)
            transferSavingsButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
            transferSavingsButton.layer.cornerRadius = 6
            transferSavingsButton.tintColor = .white
            transferSavingsButton.addTarget(self,
                                            action: #selector(transferSavings),
                                            for: .touchUpInside)
        }
    }
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView! {
        didSet {
            activityIndicatorView.isHidden = true
            activityIndicatorView.hidesWhenStopped = true
            activityIndicatorView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
    }
    @IBOutlet weak var transferDoneLabel: UILabel! {
        didSet {
            transferDoneLabel.isHidden = true
        }
    }
    @IBOutlet weak var retryButton: UIButton! {
        didSet {
            retryButton.isHidden = true
            retryButton.backgroundColor = .black
            retryButton.setTitle("tryAgain".localize(), for: .normal)
            retryButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
            retryButton.layer.cornerRadius = 6
            retryButton.tintColor = .white
            retryButton.addTarget(self,
                                  action: #selector(retryTransferSavings),
                                  for: .touchUpInside)
        }
    }
    
    // MARK: Public variables
    
    var presenter: RoundUpPresenterProtocol? =
        RoundUpPresenter(accountService: AccountService(apiClient: ApiClient()))
    var totalSavedAmount: CGFloat = 0
    
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
    
    // MARK: Actions
    
    /// Detect when transfer savings buttong is tapped
    @objc private func transferSavings() {
        transferSavingsButton.isHidden = true
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
        presenter?.transferSavings(amount: totalSavedAmount)
    }
    
    /// Detect when retry transfer savings buttong is tapped
    @objc private func retryTransferSavings() {
        retryButton.isHidden = true
        transferDoneLabel.isHidden = true
        transferDoneLabel.text = ""
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
        presenter?.transferSavings(amount: totalSavedAmount)
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
        totalSavedAmount = value
        totalSavingsValueLabel.text = "£" + value.description
        totalSavingsValueLabel.isHidden = false
    }
    
    /// Display transfer successfully made
    func displayTranferSuccessfullyMade() {
        activityIndicatorView.isHidden = true
        transferDoneLabel.text = "roundUp_transferComplete".localize()
        transferDoneLabel.isHidden = false
        totalSavingsValueLabel.text = "£0"
    }
    
    /// Show error
    func showError() {
        activityIndicatorView.isHidden = true
        transferDoneLabel.text = "genericError".localize()
        transferDoneLabel.isHidden = false
        retryButton.isHidden = false
    }
}
