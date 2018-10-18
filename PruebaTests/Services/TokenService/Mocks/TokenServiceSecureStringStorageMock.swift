//
//  SecureStringStorageMock.swift
//  PruebaTests
//
//  Created by Juan Carlos Garcia Alfaro on 10/17/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

@testable import Prueba
import Foundation

class TokenServiceSecureStringStorageMock: SecureStringStorageProtocol {
    
    enum Constant {
        static let stringMock = "1234567890"
    }
    
    var key: String?
    var value: String?
    
    func get(_ key: String) throws -> String? {
        self.key = key
        return Constant.stringMock
    }
    
    func set(_ value: String, key: String) throws {
        self.value = value
        self.key = key
    }
    
    func remove(_ key: String) throws {
        self.key = key
    }

}
