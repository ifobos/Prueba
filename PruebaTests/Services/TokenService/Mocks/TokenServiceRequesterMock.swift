//
//  RequesterMock.swift
//  PruebaTests
//
//  Created by Juan Carlos Garcia Alfaro on 10/17/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

@testable import Prueba
import Foundation

class TokenServiceRequesterMock: RequesterProtocol {
    
    var request: Request?
    lazy var encoder = JSONEncoder()
    
    var token = Token(accessToken: "")
    
    func launch(_ request: Request, completion: @escaping (Data?, Error?) -> Void) {
        self.request = request
        let data = try? encoder.encode(token)
        completion(data, nil)
    }

}
