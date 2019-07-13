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
                static let token = "znGmAU4tuL3L77dbzFUyyua5vC459uPitp8tsBysWlhMYsgPNSLr7Fx1sALrpArk"
            }
            
            enum UserAgent {
                static let name = "Ellen Ripley"
            }
        }
    }
}
