//
//  AlamoRequestRetrier.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation
import Alamofire

class AlamoRequestRetrier: AuthRetrier, RequestRetrier {
    private enum Constant {
        static let defaultTimeDelay = 0.0
    }
    var requestsToRetry: [RequestRetryCompletion] = []
    
    func should(_ manager: SessionManager,
                retry request: Alamofire.Request,
                with error: Error,
                completion: @escaping RequestRetryCompletion) {

        if isAuthError(for: request.task?.response) {
            requestsToRetry.append(completion)
            refreshToken { [weak self] (success) in
                self?.requestsToRetry.forEach({ (requestToRetry) in
                    requestToRetry(success, Constant.defaultTimeDelay)
                })
            }
        } else {
            completion(false, Constant.defaultTimeDelay)
        }
    }
}
