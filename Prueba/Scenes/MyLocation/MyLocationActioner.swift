//
//  MyLocationActioner.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/17/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit

class MyLocationActioner: NSObject {

    @IBOutlet weak var viewController: MyLocationViewController?
    
    @IBAction func closeAction(_ sender: Any) {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
