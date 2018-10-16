//
//  LocationCoordinate.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

struct LocationCoordinate: Equatable {
    let latitude: Double
    let longitude: Double
    
    static func == (lhs: LocationCoordinate, rhs: LocationCoordinate) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
