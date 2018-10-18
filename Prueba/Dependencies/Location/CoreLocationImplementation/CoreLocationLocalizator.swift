//
//  CoreLocationImplementation.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation
import CoreLocation

extension LocalizatorFactory {
    static func newLocalizator() -> LocalizatorProtocol {
        return CoreLocationLocalizator()
    }
}

class CoreLocationLocalizator: NSObject, LocalizatorProtocol {
    
    var currentLocation: GeoPoint? {
        didSet {
            guard let `currentLocation` = currentLocation else {
                return
            }
            for pendingCompletion in pendingCompletions {
                pendingCompletion(currentLocation)
            }
            pendingCompletions.removeAll()
        }
    }
    
    var locationManager: CLLocationManager
    
    var pendingCompletions: [(GeoPoint) -> Void] = []
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
    func currentLocation(completion: @escaping (GeoPoint) -> Void) {
        if let `currentLocation` = currentLocation {
            completion(currentLocation)
        } else {
            pendingCompletions.append(completion)
        }
        
    }
    
}

extension CoreLocationLocalizator: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else {
            return
        }
        currentLocation = GeoPoint(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
}
