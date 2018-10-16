//
//  AlamoRequester.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/14/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation
import Alamofire

extension RequesterFactory {
    static func newRequester() -> Requester {
        return AlamoRequester()
    }
}

class AlamoRequester: Requester {
    var authAdapter: RequestAdapter = AlamoRequestAdapter()
    var authRetrier: RequestRetrier = AlamoRequestRetrier()
    lazy var sessionManager = Alamofire.SessionManager.default
    lazy var sessionManagerAuthenticated: SessionManager = {
        let sessionManager = SessionManager()
        sessionManager.adapter = authAdapter
        sessionManager.retrier = authRetrier
        return sessionManager
    }()
    
    fileprivate init() {
    }
    
    func launch(_ request: Request, completion: @escaping (Data?, Error?) -> Void) {
        var manager = sessionManager
        if request.configuration.appAuthRequired {
            manager = sessionManagerAuthenticated
        }
        let alamoRequest = AlamoRequestConvertible(request: request)
        manager.request(alamoRequest).validate(statusCode: 200 ..< 400).responseData { (dataResponse) in
            switch dataResponse.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}
