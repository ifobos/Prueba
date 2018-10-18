//
//  RestaurantServiceTests.swift
//  PruebaTests
//
//  Created by Juan Carlos Garcia Alfaro on 10/17/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

@testable import Prueba
import XCTest

class RestaurantServiceTests: XCTestCase {
    
    var restaurantService: RestaurantService!
    
    var requesterMock: RestaurantServiceRequesterMock!
    var tokenServiceMock: RestaurantServiceTokenServiceMock!

    override func setUp() {
        restaurantService = RestaurantService()
        
        requesterMock = RestaurantServiceRequesterMock()
        tokenServiceMock = RestaurantServiceTokenServiceMock()
        
        restaurantService.requester = requesterMock
        restaurantService.tokenService = tokenServiceMock
    }
    
    func test_sinceANewSearchIsRequested_ACorrectRequestIsSent() {
        let point = GeoPoint(latitude: 1, longitude: 1)
        let pagination = Pagination(offset: 1, pageSize: 1)
        restaurantService.search(by: point, pagination: pagination) { _, _  in }
        let request = requesterMock?.request?.configuration as? SearchRestaurantsRequestConfiguration
        
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.path, "search/restaurants")
        XCTAssertEqual(request?.method, HTTPMethod.get)
        XCTAssertEqual(request?.location, point)
        XCTAssertEqual(request?.country, 1)
        XCTAssertEqual(request?.pageSize, pagination.pageSize)
        XCTAssertEqual(request?.offset, pagination.offset)
        XCTAssertEqual(request?.fields, Restaurant.fields)
        XCTAssertTrue((request?.appAuthRequired)!)
    }
    
    func test_sinceANewSearchIsRequested_theObtainedResultMustBeAModel() {
        
        let searchResult = RestaurantSearchResult(total: 1,
                                                  data: [Restaurant(name: "Old Texas", coordinates: "1,2")],
                                                  offset: 0,
                                                  count: 1)
        requesterMock.searchResult = searchResult
        let point = GeoPoint(latitude: 1, longitude: 1)
        let pagination = Pagination(offset: 1, pageSize: 1)
        restaurantService.search(by: point, pagination: pagination) { result, _  in
            XCTAssertEqual(result?.total, searchResult.total)
            XCTAssertEqual(result?.offset, searchResult.offset)
            XCTAssertEqual(result?.count, searchResult.count)
            XCTAssertEqual(result?.data?.count, searchResult.data?.count)
            XCTAssertEqual(result?.data?.first?.name, searchResult.data?.first?.name)
            XCTAssertEqual(result?.data?.last?.coordinates, searchResult.data?.last?.coordinates)
        }
        
    }

}
