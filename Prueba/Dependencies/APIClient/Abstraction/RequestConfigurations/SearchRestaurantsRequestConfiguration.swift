//
//  SearchRestaurantsRequestConfiguration.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

struct SearchRestaurantsRequestConfiguration: RequestConfiguration {
    
    let location: GeoPoint
    let country: Int
    let pageSize: Int
    let offset: Int
    let fields: [String]
    let authorizationToken: String?
    
    var path: String {
        return "search/restaurants"
    }
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [String: Any]? {
        return ["point": "\(location.latitude),\(location.longitude)",
                "country": country,
                "max": pageSize,
                "offset": offset,
                "fields": fields.joined(separator: ",")]
    }
    
    var appAuthRequired: Bool {
        return true
    }
    
}
