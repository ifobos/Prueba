//
//  RestaurantListFetcher.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit

class RestaurantListFetcher: NSObject, RestaurantsFetcherProtocol {
    var isFetching = false {
        didSet {
            updateActivityIndicator()
        }
    }
  
    // MARK: - Dependencies
    @IBOutlet weak var store: RestaurantStore?
    @IBOutlet weak var loader: RestaurantListLoader?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    var restaurantService: RestaurantServiceProtocol = RestaurantService()
    var localizator: LocalizatorProtocol = LocalizatorFactory.newLocalizator()
    
    // MARK: - Fetch handling
    
    func fetchCompletion() {
        loader?.reload()
    }

}
