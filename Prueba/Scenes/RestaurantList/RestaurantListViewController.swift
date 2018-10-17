//
//  RestaurantListViewController.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit

class RestaurantListViewController: UIViewController {

    private enum Constant {
        static let goToRestaurantsMap = "goToRestaurantsMap"
    }
    
    @IBOutlet var fetcher: RestaurantListFetcher?
    @IBOutlet var store: RestaurantStore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetcher?.fetch()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.goToRestaurantsMap,
            let destination = segue.destination as? RestaurantsMapViewController,
            let destinationStore = destination.store,
            let sourceStore = store {
            destinationStore.lastLocation = sourceStore.lastLocation
        }
    }
    
}
