//
//  TokenRequestConfiguration.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/14/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

struct TokenRequestConfiguration: RequestConfiguration {
    let clientId: String
    let clientSecret: String
    
    var path: String {
        return "tokens"
    }
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [String: Any]? {
        return ["clientId": clientId,
                "clientSecret": clientSecret]
    }

}
