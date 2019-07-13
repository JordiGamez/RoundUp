//
//  APIException.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import Foundation

/// APIException
enum APIException: Error {
    
    /// Connectivity
    case connectivityException
    
    /// Unknown
    case unknownException
}
