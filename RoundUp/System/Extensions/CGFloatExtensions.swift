//
//  CGFloatExtensions.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import UIKit

extension CGFloat {
    
    /// Rounds the CGFloat to decimal places value
    func rounded(toPlaces places:Int) -> CGFloat {
        let divisor = pow(10.0, CGFloat(places))
        
        return (self * divisor).rounded() / divisor
    }
}
