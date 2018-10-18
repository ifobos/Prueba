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
            dispatchPendingCompletions(location: currentLocation, error: error)
        }
    }
    
    var error: Error? {
        didSet {
            dispatchPendingCompletions(location: currentLocation, error: error)
        }
    }
    
    var locationManager: CLLocationManager
    
    var pendingCompletions: [(GeoPoint?, Error?) -> Void] = []
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
    func currentLocation(completion: @escaping (GeoPoint?, Error?) -> Void) {
        pendingCompletions.append(completion)
        if currentLocation != nil || error != nil {
            dispatchPendingCompletions(location: currentLocation, error: error)
        }
    }
    
    func dispatchPendingCompletions(location: GeoPoint?, error: Error?) {
        for pendingCompletion in pendingCompletions {
            pendingCompletion(location, error)
        }
        pendingCompletions.removeAll()
    }
    
}

extension CoreLocationLocalizator: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else {
            return
        }
        currentLocation = GeoPoint(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.error = error
    }

}
