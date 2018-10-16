//
//  RestaurantListDelegate.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import UIKit

class RestaurantListDelegate: NSObject, UITableViewDelegate {
    // MARK: - Dependencies
    @IBOutlet weak var store: RestaurantListStore?
    @IBOutlet weak var fetcher: RestaurantListFetcher?
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath)")
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (store?.restaurants.count ?? 1) - 1 {
            fetcher?.fetch()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}
