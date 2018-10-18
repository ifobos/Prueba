//
//  TokenServiceConfigurator.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

protocol TokenServiceConfiguratorProtocol {
    static func setup()
}

extension TokenService {
    enum Configurator: TokenServiceConfiguratorProtocol {
        static var appFirstLaunchChecker: AppFirstLaunchCheckerProtocol = AppFirstLaunchChecker()
        static var tokenStorage = SecureStringStorageFactory.newSecureStringStorage()
        
        static func setup() {
            // in case this is the first launch of a new
            // installation having deleted a previous installation
            // removes the token from the previous installation
            if !appFirstLaunchChecker.isFirstLaunch {
                try? tokenStorage.remove(Constant.secureKey)
            }
        }
    }
}
