//
//  Constants.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import Foundation

enum Constants {
    
    enum API {
        
        enum Host {
            
            enum Api {
                static let pro
                    = "https://api-sandbox.starlingbank.com"
            }
        }
        
        enum Api {
            
            static let api = "api/v2"
        }
        
        enum Header {
            
            enum Token {
                static let token = "cuE0mcsGGRMs0SdgyMmKP3eJ3CZVPJ87owDvJVpjgTRy9MX9tLy8YCR27lC6oqyd"
            }
            
            enum UserAgent {
                static let name = "Ellen Ripley"
            }
        }
    }
}
