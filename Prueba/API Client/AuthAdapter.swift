//
//  AuthAdapter.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

class AuthAdapter {
    private enum Constant {
        static let authorizationKey = "Authorization"
    }
    
    lazy var tokenService = TokenService.shared
    
    func authRequest(from urlRequest: URLRequest) -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.setValue(tokenService.accessToken, forHTTPHeaderField: Constant.authorizationKey)
        return urlRequest
    }
}
