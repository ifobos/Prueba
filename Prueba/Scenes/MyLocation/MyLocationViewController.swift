//
//  MyLocationViewController.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/17/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit

class MyLocationViewController: UIViewController {
    @IBOutlet var map: MyLocationMapConfigurator?
    @IBOutlet var store: MyLocationStore?
    @IBOutlet var actioner: MyLocationActioner?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map?.setup()
    }

}
