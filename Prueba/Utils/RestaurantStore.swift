//
//  RestaurantListStore.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit

class RestaurantStore: NSObject {
    
    var lastLocation: GeoPoint? {
        willSet {
            restaurants.removeAll()
            pagination = Pagination()
        }
    }
    
    var pagination: PaginationProtocol = Pagination()

    var restaurants = [Restaurant]()
    
}
