//
//  AppWasLaunchedChecker.swift
//  Prueba
//
//  Created by Juan Carlos Garcia Alfaro on 10/17/18.
//  Copyright © 2018 Juan Carlos Garcia Alfaro. All rights reserved.
//

import Foundation

protocol AppFirstLaunchCheckerProtocol {
    var isFirstLaunch: Bool { get }
}

class AppFirstLaunchChecker: AppFirstLaunchCheckerProtocol {
    
    private enum Constant {
        static let appWasLaunchedBeforeKey = "AppWasLaunchedBefore"
    }
    
    lazy var storage = DefaultsStorageInstance.instance()
    
    var isFirstLaunch: Bool {
        let wasLaunchedBefore = storage.bool(forKey: Constant.appWasLaunchedBeforeKey)
        if !wasLaunchedBefore {
            storage.set(true, forKey: Constant.appWasLaunchedBeforeKey)
        }
        return !wasLaunchedBefore
    }
}
