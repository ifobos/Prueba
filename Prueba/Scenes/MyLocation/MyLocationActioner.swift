//
//  MyLocationActioner.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/17/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit

class MyLocationActioner: NSObject {

    var saveAction: ((GeoPoint) -> Void)?
    @IBOutlet weak var viewController: MyLocationViewController?
    @IBOutlet weak var map: MyLocationMapConfigurator?
    
    @IBAction func closeAction(_ sender: Any) {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        if let selectedLocation = map?.configurator.selectedLocation() {
            saveAction?(selectedLocation)
        }
        viewController?.dismiss(animated: true, completion: nil)
    }
}
