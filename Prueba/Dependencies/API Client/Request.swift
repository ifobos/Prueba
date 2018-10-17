//
//  Request.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/14/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

struct Request {
    let appConfiguration: AppConfigurationProtocol
    let configuration: RequestConfiguration
    
    init(configuration: RequestConfiguration, appConfiguration: AppConfigurationProtocol = AppConfiguration.shared) {
        self.appConfiguration = appConfiguration
        self.configuration = configuration
    }
}
