//
//  RestaurantListFetcher.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit

class RestaurantListFetcher: NSObject {
    var isFetching = false {
        didSet {
            if isFetching {
                activityIndicator?.startAnimating()
            } else {
                activityIndicator?.stopAnimating()
            }
        }
    }
  
    // MARK: - Dependencies
    @IBOutlet weak var store: RestaurantListStore?
    @IBOutlet weak var loader: RestaurantListLoader?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    var restaurantService: RestaurantServiceProtocol = RestaurantService()
    var localizator = LocalizatorFactory.newLocalizator()
    
    // MARK: - Fetch handling
    func fetch() {
        guard !isFetching else {
            return
        }
        isFetching = true
        let completion: () -> Void = { [weak self] in
            self?.isFetching = false
        }
        
        // if there is a lastLocationCoordinate then do the search for that coordinate,
        // otherwise set the coordinate of the device as lastLocationCoordinate
        if let coordinate = store?.lastLocationCoordinate {
            fetchRestaurants(by: coordinate, completion: completion)
        } else {
            localizator.currentLocation { [weak self] (coordinate) in
                self?.store?.lastLocationCoordinate = coordinate
                self?.fetchRestaurants(by: coordinate, completion: completion)
            }
        }
        
    }
    
    func fetchRestaurants(by location: LocationCoordinate, completion: @escaping () -> Void) {
        guard let pagination = store?.pagination else {
            return
        }
        restaurantService.search(by: location, pagination: pagination) { [weak self] (searchResult) in
            completion()
            print("\(searchResult as Any)")
            guard let result = searchResult,
                let data = result.data,
                let offset = result.offset,
                let count = result.count,
                let total = result.total,
                offset < total else {
                    print("\(String(describing: searchResult))")
                    return
            }
            
            self?.store?.restaurants.append(contentsOf: data)
            self?.store?.pagination.offset = offset + count
            self?.loader?.reload()
        }
    }
}
