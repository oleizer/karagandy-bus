//
//  MapInteractor.swift
//  KaragandyBus
//
//  Created by Олег Лейзер on 11/12/2018.
//  Copyright © 2018 Олег Лейзер. All rights reserved.
//

//import PromiseKit
import CoreLocation

protocol MapBusinessLogic {
}

class MapInteractor: MapBusinessLogic {
    let presenter: MapPresentationLogic
    let provider: MapProviderProtocol
    let locationProvider: LocationProvider

    init(presenter: MapPresentationLogic, provider: MapProviderProtocol, locationProvider: LocationProvider = LocationProvider()) {
        self.presenter = presenter
        self.provider = provider
        self.locationProvider = locationProvider
        self.locationProvider.locationHandler = handleLocationUpdate
    }
    private func handleLocationUpdate(_ location: CLLocation?, error _: Error?) {
        guard let location = location else {
            return
        }
        print(location)
//        provider.getItems(with: location, completion: handleATMsRequestResult)
    }
}
