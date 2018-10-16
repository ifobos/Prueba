//
//  AlamoRequestConvertible.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/14/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation
import Alamofire

struct AlamoRequestConvertible: URLRequestConvertible {
    let request: Request
    var urlEncoder: ParameterEncoding = URLEncoding.default
    var jsonEncoder: ParameterEncoding = JSONEncoding.default
    
    init(request: Request) {
        self.request = request
    }
    
    var encoder: ParameterEncoding {
        switch request.configuration.method {
        case .get, .delete:
            return urlEncoder
        default:
            return jsonEncoder
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url: URL = try request.appConfiguration.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(request.configuration.path))
        urlRequest.httpMethod = request.configuration.method.rawValue
        if let parameters = request.configuration.parameters {
            urlRequest = try encoder.encode(urlRequest, with: parameters)
        }
        return urlRequest
    }
    
}
