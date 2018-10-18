//
//  RestaurantSearchResult.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

struct RestaurantSearchResult: Codable {
    let total: Int?
    let data: [Restaurant]?
    let offset: Int?
    let count: Int?
}
