//
//  RestaurantsMapViewController.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit

class RestaurantsMapViewController: UIViewController {
    @IBOutlet var map: RestaurantsMapConfigurator?
    @IBOutlet var store: RestaurantStore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map?.setup()
    }
    
}
