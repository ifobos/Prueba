//
//  RestaurantsMapLoader.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit

class RestaurantsMapConfigurator: NSObject {

    @IBOutlet weak var mapContainer: UIView?
    @IBOutlet weak var fetcher: RestaurantsMapFetcher?
    @IBOutlet weak var store: RestaurantStore?
    
    lazy var configurator = MapViewConfiguratorFactory.newMapViewConfigurator()

    func setup() {
        guard let location = store?.lastLocation,
            let `mapContainer` = mapContainer else {
            return
        }
        configurator.setup(in: mapContainer, location: location, pickerEnable: true)
        configurator.didChangePosition { [weak self] (newLocation) in
            self?.store?.lastLocation = newLocation
            self?.fetcher?.fetch()
        }
    }
}
