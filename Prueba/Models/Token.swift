//
//  Token.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/14/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

struct Token: Codable {
    let accessToken: String?
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}
