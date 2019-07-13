//
//  RoundUpViewControllerProtocol.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import UIKit

/// Abstraction for RoundUpViewController
protocol RoundUpViewControllerProtocol: BaseViewControllerProtocol {
    
    /// Display the total saved amount
    ///
    /// - Parameter value: amount in CGFloat format
    func displayTotalSavedAmount(value: CGFloat)
    
    /// Show error
    func showError()
}
