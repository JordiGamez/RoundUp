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
            return "feed/account/\(accountId)/category/\(categoryId)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default: return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        default: return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default: return URLEncoding.default
        }
    }
    
    var headers: HTTPHeaders? {
        return [
            "Accept": "application/json",
            "Authorization": "Bearer \(Constants.API.Header.Token.token)",
            "User-Agent": "\(Constants.API.Header.UserAgent.name)"
        ]
    }
}
