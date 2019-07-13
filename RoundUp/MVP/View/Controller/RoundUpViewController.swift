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
    
    
    
    // MARK: Public variables
    
    var presenter: RoundUpPresenterProtocol?
    
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
}
