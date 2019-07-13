//
//  RoundUpPresenterProtocol.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import Foundation

/// Abstraction for RoundUpPresenter
protocol RoundUpPresenterProtocol: BasePresenterProtocol {
    
    /// Bind the view with the presenter
    ///
    /// - Parameter view: RoundUpViewControllerProtocol object
    func bind(view: RoundUpViewControllerProtocol)
}
