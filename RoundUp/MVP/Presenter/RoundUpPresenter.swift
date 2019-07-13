//
//  RoundUpPresenter.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import Foundation

/// RoundUpPresenter
final class RoundUpPresenter {
    
    // MARK: Public variables
    
    var view: RoundUpViewControllerProtocol?
}

// MARK: - RoundUpPresenterProtocol protocol conformance

extension RoundUpPresenter: RoundUpPresenterProtocol {
    
    /// Tells the presenter that the view has loaded
    func viewDidLoad() {
        view?.setupView()
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
