//
//  MapViewConfiguratorFactory.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

protocol MapViewConfiguratorFactoryProtocol {
    static func newMapViewConfigurator() -> MapViewConfiguratorProtocol
}

enum MapViewConfiguratorFactory: MapViewConfiguratorFactoryProtocol {
    // This factory has no implementation because it must be extended and implemented from the default dependency
}
