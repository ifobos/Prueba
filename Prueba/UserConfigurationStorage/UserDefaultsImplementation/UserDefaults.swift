//
//  UserDefaults.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

extension UserDefaults: ConfigurationStorageProtocol {}

extension ConfigurationStorageFactory {
    static func newConfigurationStorage() -> ConfigurationStorageProtocol {
        return UserDefaults.standard
    }
}
