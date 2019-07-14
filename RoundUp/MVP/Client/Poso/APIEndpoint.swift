//
//  APIEndpoint.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import Foundation
import Alamofire

/// APIEndpoint
enum APIEndpoint {
    
    // MARK: Endpoints
    
    case accounts
    case transactions(accountId: String, categoryId: String)
    case savingsGoals(accountId: String)
    case transferMoneyToSavingsGoal(accountId: String, savingsGoalId: String,
        amount: CGFloat)
    
    // MARK: Public variables
    
    var host: String {
        return Constants.API.Host.Api.pro
    }
    
    var api: String {
        return Constants.API.Api.api
    }
    
    var path: String {
        switch self {
        case .accounts:
            return "accounts"
        case .transactions(let accountId, let categoryId):
            return "feed/account/\(accountId)/category/\(categoryId)/transactions-between/?minTransactionTimestamp=2019-07-08T00:00:00.000Z&maxTransactionTimestamp=2019-07-14T00:00:00.000Z"
        case .savingsGoals(let accountId):
            return "account/\(accountId)/savings-goals"
        case .transferMoneyToSavingsGoal(let accountId, let savingsGoalId, _):
            return "account/\(accountId)/savings-goals/\(savingsGoalId)/add-money/\(UUID().uuidString)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .savingsGoals(_): return .put
        case .transferMoneyToSavingsGoal(_, _, _): return .put
        default: return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .savingsGoals(_):
            return [
                "name": "Saving account",
                "currency": "GBP",
                "target": [
                    "currency": "GBP",
                    "minorUnits": 100000
                ],
                "base64EncodedPhoto": "string"
            ]
        case .transferMoneyToSavingsGoal(_, _, let amount):
            return [
                "amount": [
                    "currency": "GBP",
                    "minorUnits": Int(amount * 100)
                ]
            ]
        default: return nil
        }
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .savingsGoals(_), .transferMoneyToSavingsGoal(_, _, _):
            return [
                "Accept": "application/json",
                "Authorization": "Bearer \(Constants.API.Header.Token.token)",
                "User-Agent": "\(Constants.API.Header.UserAgent.name)",
                "Content-Type": "application/json"
            ]
        default:
            return [
                "Accept": "application/json",
                "Authorization": "Bearer \(Constants.API.Header.Token.token)",
                "User-Agent": "\(Constants.API.Header.UserAgent.name)"
            ]
        }
    }
}
