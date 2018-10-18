//
//  RestaurantServiceTokenServiceMock.swift
//  PruebaTests
//
//  Created by Juan Carlos Garcia Alfaro on 10/17/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

@testable import Prueba
import Foundation

class RestaurantServiceTokenServiceMock: TokenServiceProtocol {
    
    enum Constant {
        static let accessToken = "1234567890"
    }
    
    var accessToken: String? {
        return Constant.accessToken
    }
    
    func fetchToken(completion: ((String?) -> Void)?) {
        completion?(Constant.accessToken)
    }

}
