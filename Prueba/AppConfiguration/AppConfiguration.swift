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

struct AppConfiguration: AppConfigurationProtocol, Decodable {
    
    static let shared: AppConfigurationProtocol = AppConfiguration.defaultConfiguration()

    static let configurationFileName = "AppConfiguration"
    static let configurationFileType = "plist"

    let defaultCountryId: Int
    let defaultPageSize: Int
    let baseURL: String
}

extension AppConfiguration {
    private static func defaultConfiguration() -> AppConfiguration {
        do {
            let configuration = try loadFromConfigurationFile()
            return configuration
        } catch let error {
            assertionFailure("\(error.localizedDescription)")
            
            return AppConfiguration(defaultCountryId: 0, defaultPageSize: 0, baseURL: "")
        }
    }
    
    private static func loadFromConfigurationFile() throws -> AppConfiguration {
        let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
        let decoder = PropertyListDecoder()
        let configuration = try decoder.decode(AppConfiguration.self, from: data)
        return configuration
    }
    
    private static var filePath: String {
        if let path = Bundle.main.path(forResource: configurationFileName, ofType: configurationFileType),
            FileManager.default.fileExists(atPath: path) {
            return path
        } else {
            return ""
        }
    }
}

extension AppConfiguration {
    var clientId: String {
        return "<<clientId>>"
    }
    
    var clientSecret: String {
        return "<<clientSecret>>"
    }
}
