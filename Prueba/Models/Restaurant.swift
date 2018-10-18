//
//  Restaurant.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

struct Restaurant: Codable {
    let name: String?
    let coordinates: String?
    
    private enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case coordinates
    }
}

extension Restaurant {
    var location: GeoPoint? {
        guard let `coordinates` = coordinates else {
            return nil
        }
        let coordinatesValues = coordinates.split(separator: ",")
        guard coordinatesValues.count == 2,
            let latitudeString = coordinatesValues.first,
            let longitudeString = coordinatesValues.last,
            let latitude = Double(latitudeString),
            let longitude = Double(longitudeString) else {
                return nil
        }
        return GeoPoint(latitude: latitude, longitude: longitude)
    }
    
    static var fields: [String] {
        return Restaurant.CodingKeys.allCases.map({ (key) -> String in
            return key.rawValue
        })
    }
}
