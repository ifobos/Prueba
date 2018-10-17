//
//  GoogleMapViewConfigurator+Utils.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit
import GoogleMaps

extension GoogleMapViewConfigurator {
    
    func setupView(_ view: UIView) {
        mapView.frame = view.bounds
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        let leftConstraint = mapView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
        let rightConstraint = mapView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        let topConstraint = mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        let bottomConstraint = mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        view.addConstraints([leftConstraint, rightConstraint, topConstraint, bottomConstraint])
    }
    
    func setupCamera(_ location: GeoPoint) {
        let camera = GMSCameraPosition.camera(withLatitude: location.latitude,
                                              longitude: location.longitude,
                                              zoom: Constant.defaultZoom)
        mapView.camera = camera
        defaultCamera = camera
    }
}
