//
//  DefaultsStorageInstance.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

protocol DefaultsStorageInstanceProtocol {
    static func instance() -> DefaultsStorageProtocol
}

enum DefaultsStorageInstance: DefaultsStorageInstanceProtocol {
    // This factory has no implementation because it must be extended and implemented from the default dependency
}
