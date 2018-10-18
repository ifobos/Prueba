//
//  KeychainAccess.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/14/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation
import KeychainAccess

extension Keychain: SecureStringStorageProtocol {}

extension SecureStringStorageFactory {
    static func newSecureStringStorage() -> SecureStringStorageProtocol {
        return Keychain(service: "Prueba App Auth 🔑")
    }
}
