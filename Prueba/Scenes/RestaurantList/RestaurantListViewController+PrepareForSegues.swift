//
//  RestaurantListViewController+PrepareForSegues.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/17/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

extension RestaurantListViewController {
    
    func prepateForGo(to destination: RestaurantsMapViewController) {
        guard let destinationStore = destination.store,
            let sourceStore = store else {
                return
        }
        destinationStore.lastLocation = sourceStore.lastLocation
    }
    
    func prepateForGo(to destination: MyLocationViewController) {
        guard let destinationStore = destination.store,
            let sourceStore = store,
            let destinationActioner = destination.actioner else {
                return
        }
        destinationStore.myCurrentLocation = sourceStore.lastLocation
        destinationActioner.saveAction = { [weak self] newLocation in
            self?.store?.lastLocation = newLocation
            self?.fetcher?.fetch()
        }
    }
}
