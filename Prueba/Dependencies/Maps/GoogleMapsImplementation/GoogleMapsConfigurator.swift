//
//  GoogleMapsConfigurator.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation
import GoogleMaps

extension MapsConfigurator {
    private enum Constant {
        static let googleApiKey = "AIzaSyCvtKo26lciOugQ_2qfNr2WK8cuZx6-XeQ"
    }
    
    static func setup() {
        GMSServices.provideAPIKey(Constant.googleApiKey)
    }
}
