//
//  MyLocationMapConfigurator.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/17/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit

class MyLocationMapConfigurator: NSObject {
    
    @IBOutlet weak var mapContainer: UIView?
    @IBOutlet weak var store: MyLocationStore?
    
    lazy var configurator = MapViewConfiguratorFactory.newMapViewConfigurator()
    
    func setup() {
        guard let location = store?.myCurrentLocation,
            let `mapContainer` = mapContainer else {
                return
        }
        configurator.setup(in: mapContainer, location: location, pickerEnable: true)
    }
    

}
