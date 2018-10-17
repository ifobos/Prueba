//
//  ConfigurationStorageFactory.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

protocol ConfigurationStorageFactoryProtocol {
    static func newConfigurationStorage() -> ConfigurationStorageProtocol
}

enum ConfigurationStorageFactory: ConfigurationStorageFactoryProtocol {
    // This factory has no implementation because it must be extended and implemented from the default dependency
}
