//
//  GoogleMapViewConfigurator+MapViewDelegate.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation
import GoogleMaps

extension GoogleMapViewConfigurator: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        guard let `defaultCamera` = defaultCamera else {
            return
        }
        self.defaultCamera = nil
        mapView.camera = defaultCamera
    }
    
    func mapViewSnapshotReady(_ mapView: GMSMapView) {
        let target = mapView.camera.target
        let location = GeoPoint(latitude: target.latitude,
                                longitude: target.longitude)
        didChangePosition?(location)
    }
    
}
