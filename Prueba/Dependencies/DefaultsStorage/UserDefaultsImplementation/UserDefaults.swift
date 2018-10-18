//
//  UserDefaults.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

extension UserDefaults: DefaultsStorageProtocol {}

extension DefaultsStorageInstance {
    static func instance() -> DefaultsStorageProtocol {
        return UserDefaults.standard
    }
}
