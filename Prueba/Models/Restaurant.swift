//
//  Restaurant.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

struct Restaurant: Decodable {
    let name: String?
    let coordinates: String?
    
    private enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case coordinates
    }
    
    static var fields: [String] {
        return Restaurant.CodingKeys.allCases.map({ (key) -> String in
            return key.rawValue
        })
    }
}
