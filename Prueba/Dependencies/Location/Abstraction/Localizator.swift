//
//  Localizator.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/16/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

protocol LocalizatorProtocol {
    func currentLocation(completion: @escaping (GeoPoint?, Error?) -> Void)
}
