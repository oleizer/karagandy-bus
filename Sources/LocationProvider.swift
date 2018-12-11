//
//  LocationProvider.swift
//  KaragandyBus
//
//  Created by Олег Лейзер on 11/12/2018.
//  Copyright © 2018 Олег Лейзер. All rights reserved.
//

import CoreLocation

class LocationProvider: NSObject {
    typealias LocationHandlerType = (CLLocation?, Error?) -> Void
    var locationHandler: LocationHandlerType?

    private var locationManager: CLLocationManager?
    private var strongSelfReference: LocationProvider?
    var isLocationUpdatingInProcess: Bool {
        return strongSelfReference != nil
    }
    
    init(locationHandler: LocationHandlerType? = nil) {
        self.locationHandler = locationHandler
        super.init()
    }
    
    func updateLocation() {
        updateLocation { CLLocationManager() }
    }
    
    func updateLocation(locationManagerFactory: () -> CLLocationManager) {
        guard isLocationUpdatingInProcess == false else {
            return
        }
        
        strongSelfReference = self
        locationManager = locationManagerFactory()
        locationManager?.delegate = self
        locationManager?.startUpdatingLocation()
    }
    
    func stopUpdating() {
        locationManager?.stopUpdatingLocation()
        locationManager = nil
        strongSelfReference = nil
    }
    
    fileprivate func didUpdateLocations(locations: [CLLocation]) {
        guard let lastLocation = locations.last else {
            return
        }
        
        stopUpdating()
        locationHandler?(lastLocation, nil)
    }
    
    fileprivate func didFailWithError(error: Error) {
        stopUpdating()
        locationHandler?(nil, error)
    }
}

extension LocationProvider: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}
