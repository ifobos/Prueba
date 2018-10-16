//
//  TokenService.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/14/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

protocol TokenServiceProtocol {
    var accessToken: String? { get }
    func fetchToken(completion: ((String?) -> Void)?)
}

class TokenService: TokenServiceProtocol {
    
    enum Constant {
        static let secureKey = "access_token"
    }
    
    // MARK: - Dependencies
    lazy var requester = RequesterFactory.newRequester()
    lazy var decoder = JSONDecoder()
    lazy var tokenStorage = TokenStorageFactory.newSecureStringStorage()
    lazy var userConfigurations = UserConfigurations()

    // MARK: - Token handling
    /// computed property that returns the application access token
    var accessToken: String? {
        guard let accessToken = try? tokenStorage.get(Constant.secureKey) else {
            return nil
        }
        return accessToken
    }
    
    /// function that performs the request for a new token to store in the storage token
    func fetchToken(completion: ((String?) -> Void)? = nil) {
        let tokenRequestConfiguration = TokenRequestConfiguration(clientId: AppConfiguration.shared.clientId,
                                                                  clientSecret: AppConfiguration.shared.clientSecret)
        let request = Request(configuration: tokenRequestConfiguration)
        requester.launch(request) {[weak self](data, error) in
            guard let `data` = data,
                let token = try? self?.decoder.decode(Token.self, from: data),
                let accessToken = token?.accessToken else {
                debugPrint("File: \(#file) Line: \(#line) Error: \(error as Any)")
                completion?(nil)
                return
            }
            try? self?.tokenStorage.set(accessToken, key: Constant.secureKey)
            completion?(accessToken)
        }
    }
    
}
