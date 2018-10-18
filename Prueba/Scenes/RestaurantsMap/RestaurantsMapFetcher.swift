//
//  RestaurantsMapFetcher.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit

class RestaurantsMapFetcher: NSObject, RestaurantsFetcherProtocol {

    var isFetching = false {
        didSet {
            updateActivityIndicator()
        }
    }
    
    // MARK: - Dependencies
    @IBOutlet weak var map: RestaurantsMapConfigurator?
    @IBOutlet weak var store: RestaurantStore?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    var restaurantService: RestaurantServiceProtocol = RestaurantService()
    var localizator: LocalizatorProtocol = LocalizatorFactory.newLocalizator()
    
    // MARK: - Fetch handling
    
    func fetchSuccess() {
        map?.configurator.loadRestaurants(store?.restaurants)
    }
    
}
