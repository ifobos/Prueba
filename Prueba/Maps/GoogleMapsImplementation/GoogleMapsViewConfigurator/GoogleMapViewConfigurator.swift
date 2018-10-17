//
//  GoogleMapViewConfigurator.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

import UIKit
import GoogleMaps

extension MapViewConfiguratorFactory {
    static func newMapViewConfigurator() -> MapViewConfiguratorProtocol {
        return GoogleMapViewConfigurator()
    }
}

class GoogleMapViewConfigurator: NSObject, MapViewConfiguratorProtocol {
    
    enum Constant {
        static let defaultZoom: Float = 18.0
        static let defaultFrame = UIScreen.main.bounds
    }
    
    var mapView = GMSMapView(frame: Constant.defaultFrame)
    var defaultCamera: GMSCameraPosition?
    var didChangePosition: ((GeoPoint) -> Void)?
    var locationsPresented = [String]()
    
    var pickerMarker: GMSMarker?
    
    func setup(in view: UIView, location: GeoPoint, pickerEnable: Bool) {
        mapView.delegate = self
        setupView(view)
        setupCamera(location)
        if pickerEnable {
            setupPickerMarker(with: location)
        }
    }
    
    func loadRestaurants(_ restaurants: [Restaurant]?) {
        guard let `restaurants` = restaurants else {
            return
        }
        for restaurant in restaurants {
            guard let location = restaurant.location,
                let locationString = restaurant.coordinates,
                !locationsPresented.contains(locationString) else {
                continue
            }
            
            locationsPresented.append(locationString)
            
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: location.latitude,
                                                     longitude: location.longitude)
            marker.title = restaurant.name
            marker.snippet = restaurant.coordinates
            marker.map = mapView
        }
    }
    
    func didChangePosition(_ block: @escaping (GeoPoint) -> Void) {
        self.didChangePosition = block
    }

}
