//
//  TokenServiceTests.swift
//  PruebaTests
//
//  Created by Juan Carlos Garcia Alfaro on 10/17/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

@testable import Prueba
import XCTest

class TokenServiceTests: XCTestCase {
    
    var tokenService: TokenService!

    var requesterMock: TokenServiceRequesterMock!
    var secureStringStorageMock: TokenServiceSecureStringStorageMock!

    override func setUp() {
        tokenService = TokenService()
        
        requesterMock = TokenServiceRequesterMock()
        secureStringStorageMock = TokenServiceSecureStringStorageMock()
        
        tokenService.requester = requesterMock
        tokenService.tokenStorage = secureStringStorageMock
    }
    
    func test_givenATokenInTheSecureStorage_theTokenIsReturnedCorrectly() {
        let accessToken = tokenService.accessToken
        XCTAssertEqual(accessToken, TokenServiceSecureStringStorageMock.Constant.stringMock)
    }
        
    func test_sinceANewTokenIsRequested_ACorrectRequestIsSent() {
        tokenService.fetchToken()
        let request = requesterMock?.request?.configuration as? TokenRequestConfiguration
    
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.path, "tokens")
        XCTAssertEqual(request?.method, HTTPMethod.get)
        XCTAssertEqual(request?.clientId, "trivia_f")
        XCTAssertEqual(request?.clientSecret, "PeY@@Tr1v1@943")
        XCTAssertFalse((request?.appAuthRequired)!)
    }
    
    func test_sinceANewTokenIsRequested_theObtainedTokenMustBeStoredInASecureStringStorage() {
        let token = Token(accessToken: "1234567890")
        requesterMock.token = token
        tokenService.fetchToken()
        XCTAssertEqual(secureStringStorageMock.key, TokenService.Constant.secureKey)
        XCTAssertEqual(secureStringStorageMock.value, requesterMock.token.accessToken)
    }

}
