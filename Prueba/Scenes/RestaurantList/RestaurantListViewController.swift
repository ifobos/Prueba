//
//  RestaurantListViewController.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit

class RestaurantListViewController: UIViewController {

    @IBOutlet var fetcher: RestaurantListFetcher?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetcher?.fetch()
    }
    
}
