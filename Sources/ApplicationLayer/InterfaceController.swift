//
//  InterfaceController.swift
//  KaragandyBus
//
//  Created by Олег Лейзер on 11/12/2018.
//  Copyright © 2018 Олег Лейзер. All rights reserved.
//

import UIKit

class InterfaceController: NSObject {
    static let shared = InterfaceController()
    var window: UIWindow!

    func configureWithWindow(_ window: UIWindow) {
        self.window = window
//        setupApplicationStateObserving()
//        setupNetworkObserving()
    }
    func setUpUserInterface() {
        window.rootViewController = MapAssembly().assembly()
    }
}

