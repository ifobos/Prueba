//
//  AbstractRestaurantFetcher.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit

protocol RestaurantsFetcherProtocol: class {
    var isFetching: Bool { get set }
    var activityIndicator: UIActivityIndicatorView? { get }
    
    var store: RestaurantStore? { get }
    var restaurantService: RestaurantServiceProtocol { get }
    var localizator: LocalizatorProtocol { get }
    
    func fetch()
    func fetchSuccess()
    func fetchFailure(_ error: Error?)
}

extension RestaurantsFetcherProtocol {
    func updateActivityIndicator() {
        if isFetching {
            activityIndicator?.startAnimating()
        } else {
            activityIndicator?.stopAnimating()
        }
    }
    
    func fetch() {
        guard !isFetching else {
            return
        }
        isFetching = true
        let completion: () -> Void = { [weak self] in
            self?.isFetching = false
        }
        
        // if there is a lastLocation then do the search for that coordinate,
        // otherwise set the coordinate of the device as lastLocation
        if let coordinate = store?.lastLocation {
            fetchRestaurants(by: coordinate, completion: completion)
        } else {
            localizator.currentLocation { [weak self] (coordinate, error) in
                guard let `coordinate` = coordinate else {
                    completion()
                    self?.fetchFailure(error)
                    return
                }
                self?.store?.lastLocation = coordinate
                self?.fetchRestaurants(by: coordinate, completion: completion)
            }
        }
    }
    
    func fetchRestaurants(by location: GeoPoint, completion: @escaping () -> Void) {
        guard let pagination = store?.pagination else {
            return
        }
        restaurantService.search(by: location, pagination: pagination) { [weak self] (searchResult, error) in
            completion()
            print("\(searchResult as Any)")
            guard let result = searchResult,
                let data = result.data,
                let offset = result.offset,
                let count = result.count,
                let total = result.total,
                offset < total else {
                    print("\(String(describing: searchResult))")
                    self?.fetchFailure(error)
                    return
            }
            
            self?.store?.restaurants.append(contentsOf: data)
            self?.store?.pagination.offset = offset + count
            self?.fetchSuccess()
        }
    }
    
    func fetchFailure(_ error: Error?) {}

}
