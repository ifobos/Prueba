//
//  KeychainAccess.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/14/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation
import KeychainAccess

extension Keychain: SecureStringStorage {}

extension TokenStorageFactory {
    static func newSecureStringStorage() -> SecureStringStorage {
        return Keychain(service: "Prueba App Auth 🔑")
    }
}
