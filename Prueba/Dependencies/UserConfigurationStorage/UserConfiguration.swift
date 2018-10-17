//
//  UserConfiguration.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

protocol ConfigurationStorageProtocol {
    func bool(forKey defaultName: String) -> Bool
    func set(_ value: Bool, forKey defaultName: String)
}

class UserConfigurations {
    private enum Constant {
        static let wasLaunchedBeforeKey = "wasLaunchedBefore"
    }
    
    lazy var storage = ConfigurationStorageFactory.newConfigurationStorage()

    public var wasLaunchedBefore: Bool {
        get {
            return storage.bool(forKey: Constant.wasLaunchedBeforeKey)
        }
        set {
            storage.set(newValue, forKey: Constant.wasLaunchedBeforeKey)
        }
    }    
}
