//
//  MapViewConfigurator.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation
import UIKit

protocol MapViewConfiguratorProtocol {
    func setup(in view: UIView, location: GeoPoint, pickerEnable: Bool)
    func loadRestaurants(_ restaurants: [Restaurant]?)
    func didChangePosition(_ block: @escaping (GeoPoint) -> Void)
    func selectedLocation() -> GeoPoint?
}
