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
    @IBOutlet weak var currentLocationLabel: UILabel?
    @IBOutlet weak var messageLabel: UILabel?
    @IBOutlet var actionButtons: [UIBarButtonItem]?
    
    func reload() {
        messageLabel?.text = nil
        for button in actionButtons ?? [] {
            button.isEnabled = true
        }
        currentLocationLabel?.text = store?.lastLocation?.description
        UIView.performWithoutAnimation {
            tableView?.reloadSections([0], with: .none)
        }
    }
    
    func load(_ error: Error?) {
        guard let `error` = error else {
            return
        }
        store?.lastLocation = nil
        reload()
        messageLabel?.text = error.localizedDescription
        for button in actionButtons ?? [] {
            button.isEnabled = false
        }
    }
    
}
