//
//  RestaurantService.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

protocol RestaurantServiceProtocol {
    func search(by point: (latitude: Double, longitude: Double),
                pagination: PaginationProtocol,
                completion: @escaping (RestaurantSearchResult?) -> Void )
}

class RestaurantService: RestaurantServiceProtocol {
    
    // MARK: - Dependencies
    lazy var requester = RequesterFactory.newRequester()
    lazy var decoder = JSONDecoder()
    lazy var tokenService = TokenService.shared
    lazy var appConfiguration = AppConfiguration.shared
    
    // MARK: - Search handling
    func search(by point: (latitude: Double, longitude: Double),
                pagination: PaginationProtocol,
                completion: @escaping (RestaurantSearchResult?) -> Void ) {
        
        let requestConfiguration = SearchRestaurantsRequestConfiguration(point: point,
                                                                         country: appConfiguration.defaultCountryId,
                                                                         pageSize: pagination.pageSize,
                                                                         offset: pagination.offset,
                                                                         fields: Restaurant.fields,
                                                                         authorizationToken: tokenService.accessToken)
        let request = Request(configuration: requestConfiguration)
        requester.launch(request) {[weak self] (data, error) in
            guard let `data` = data,
                let searchResult = try? self?.decoder.decode(RestaurantSearchResult.self, from: data) else {
                debugPrint("File: \(#file) Line: \(#line) Error: \(error as Any)")
                completion(nil)
                return
            }
            completion(searchResult)
        }
    }
        
}
