//
//  RestaurantListLoader.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit

class RestaurantListLoader: NSObject {
    
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var store: RestaurantStore?
    @IBOutlet weak var navigationItem: UINavigationItem?
    
    func reload() {
        navigationItem?.title = store?.lastLocation?.description
        UIView.performWithoutAnimation {
            tableView?.reloadSections([0], with: .none)
        }
    }
    
}
