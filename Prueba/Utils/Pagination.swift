//
//  Pagination.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/15/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

protocol PaginationProtocol {
    var pageSize: Int { get }
    var offset: Int { get set }
}

class Pagination: PaginationProtocol {
    let pageSize: Int
    var offset: Int
    
    init(offset: Int = 0, pageSize: Int = AppConfiguration.shared.defaultPageSize) {
        self.offset = offset
        self.pageSize = pageSize
    }
}
