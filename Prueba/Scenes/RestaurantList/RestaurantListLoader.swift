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
    
    func reload() {
        UIView.performWithoutAnimation {
            tableView?.reloadSections([0], with: .none)
        }
    }
    
}
