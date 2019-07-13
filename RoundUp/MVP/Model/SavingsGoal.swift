//
//  SavingsGoal.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import Foundation

/// SavingsGoal
struct SavingsGoal: Codable {
    
    // MARK: Public enums
    
    enum CodingKeys: String, CodingKey {
        case savingsGoalUid     = "savingsGoalUid"
        case success            = "success"
    }
    
    // MARK: Public variables
    
    var savingsGoalUid: String?
    var success: Bool?
}
