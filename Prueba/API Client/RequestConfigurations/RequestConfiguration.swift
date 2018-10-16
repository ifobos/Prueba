//
//  RequestConfiguration.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/14/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

enum HeaderKey {
    static let authorization = "Authorization"
}

public typealias Parameters = [String: Any]

protocol RequestConfiguration {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var appAuthRequired : Bool { get }
}

extension RequestConfiguration {
    var parameters: Parameters? {
        return nil
    }
    
    var appAuthRequired : Bool {
        return false
    }
    
}
