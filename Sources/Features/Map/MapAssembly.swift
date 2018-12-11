//
//  MapAssembly.swift
//  KaragandyBus
//
//  Created by Олег Лейзер on 11/12/2018.
//  Copyright © 2018 Олег Лейзер. All rights reserved.
//

import UIKit

class MapAssembly: Assembly {
    func assembly() -> UIViewController {
        let presenter = MapPresenter()
        let interactor = MapInteractor(presenter: presenter, provider: MapProvider())
        let viewController = MapViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
