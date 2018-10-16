//
//  RestaurantListDataSource.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit

class RestaurantListDataSource: NSObject, UITableViewDataSource {
    private enum Constant {
        static let cellReusableIdentifier = "cell"
    }
    
    // MARK: - Dependencies
    @IBOutlet weak var store: RestaurantListStore?
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let `store` = store else {
            return 0
        }
        return store.restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellReusableIdentifier) else {
            return UITableViewCell()
        }
        if let restaurant = store?.restaurants[indexPath.row] {
            cell.textLabel?.text = "\(indexPath.row)  " + (restaurant.name ?? "")
            cell.detailTextLabel?.text = restaurant.coordinates
        }
        return cell
    }

}
