//
//  RestaurantsMapActioner.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit

class RestaurantsMapActioner: NSObject {
    
    @IBOutlet weak var viewController: RestaurantsMapViewController?
    
    @IBAction func closeAction(_ sender: Any) {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
}
