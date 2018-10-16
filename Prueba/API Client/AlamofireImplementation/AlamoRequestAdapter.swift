//
//  AlamoRequestAdapter.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation
import Alamofire

class AlamoRequestAdapter: AuthAdapter, RequestAdapter {
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        return authRequest(from: urlRequest)
    }
}
