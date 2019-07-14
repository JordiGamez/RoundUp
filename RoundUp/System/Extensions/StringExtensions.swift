//
//  StringExtensions.swift
//  RoundUp
//
//  Created by Jordi Gámez on 14/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import Foundation

extension String {
    
    /// Localize
    ///
    /// - Returns: Lozalized string
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
