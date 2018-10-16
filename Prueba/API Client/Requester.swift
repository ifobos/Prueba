//
//  Requester.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/14/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

protocol Requester {
    func launch(_ request: Request, completion: @escaping (Data?, Error?) -> Void)
}
