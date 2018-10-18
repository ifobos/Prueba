//
//  MapsConfigurator.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

protocol MapsConfiguratorProtocol {
    static func setup()
}

enum MapsConfigurator: MapsConfiguratorProtocol {
    // This Configurator has no implementation because it must be extended and implemented from the default dependency
}
