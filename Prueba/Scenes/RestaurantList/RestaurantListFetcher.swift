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
    var pagination: PaginationProtocol = Pagination()
    var restaurantService: RestaurantServiceProtocol = RestaurantService()
    
    // MARK: - Fetch handling
    func fetch() {
        guard !isFetching else {
            return
        }
        isFetching = true
        restaurantService.search(by: (-34.90469, -56.19264), pagination: pagination) { [weak self] (searchResult) in
            self?.isFetching = false
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
            self?.pagination.offset = offset + count
            self?.loader?.reload()
        }
    }
}
