//
//  AuthRetrier.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

class AuthRetrier {
    private enum Constant {
        static let forbiddenStatusCode = 403
    }
    lazy var tokenService = TokenService.shared
    var isRefreshing = false
    
    func isAuthError(for response: URLResponse?) -> Bool {
        guard let `response` = response as? HTTPURLResponse,
            response.statusCode == Constant.forbiddenStatusCode else {
                return false
        }
        return true
    }
    
    func refreshToken(completion: @escaping (Bool) -> Void) {
        if isRefreshing {
            return
        }
        isRefreshing = true
        tokenService.fetchToken { [weak self] (token) in
            self?.isRefreshing = false
            let success = token != nil
            completion(success)
        }
    }
}
