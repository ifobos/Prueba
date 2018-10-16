//
//  APIConfiguration.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/14/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

protocol AppConfigurationProtocol {
    var baseURL: String { get }
    var clientId: String { get }
    var clientSecret: String { get }
    var defaultCountryId: Int { get }
    var defaultPageSize: Int { get }
}

class AppConfiguration: AppConfigurationProtocol {
    
    // TODO: JC - Load from Plist
    
    static let shared: AppConfigurationProtocol = AppConfiguration()
    
    private init() {
    }
    
    var defaultCountryId: Int {
        return 1
    }
    
    var defaultPageSize: Int {
        return 50
    }
    
    var baseURL: String {
        return "https://stg-api.pedidosya.com/public/v1/"
    }
    
    var clientId: String {
        return "trivia_f"
    }
    
    var clientSecret: String {
        return "PeY@@Tr1v1@943"
    }
}
