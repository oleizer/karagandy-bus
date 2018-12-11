//
//  LocationProviderTests.swift
//  KaragandyBus
//
//  Created by Олег Лейзер on 11/12/2018.
//  Copyright © 2018 Олег Лейзер. All rights reserved.
//

import Quick
import Nimble
import CoreLocation
@testable import KaragandyBus

class LocationProviderTests: QuickSpec {
    override func spec() {
        describe("LocationProvider") {
            context("updateLocation", closure: {
                it("should get some location", closure: {
                    let expectedLocation = CLLocation()
                    let locationManager = LocationManagerMock(location: expectedLocation, error: nil)
                    var locationProvider: LocationProvider?
                    
                    locationProvider = LocationProvider { [weak locationProvider] location, error in
                        expect(locationProvider?.isLocationUpdatingInProcess).to(beFalsy())
                        expect(locationManager.stopUpdatingLocationDidCalled).to(beTrue())
                        expect(error).to(beNil())
                        expect(location === expectedLocation).to(beTrue())
                    }

                })
            })
        }
    }
    class LocationManagerMock: CLLocationManager {
        private var expectedLocation: CLLocation? = nil
        private let expectedError: Error?
        private(set) var stopUpdatingLocationDidCalled = false
        
        init(location: CLLocation?, error: Error?) {
            expectedLocation = location
            expectedError = error
            super.init()
        }
        override func startUpdatingLocation() {
            if let expectedError = expectedError {
                delegate?.locationManager?(self, didFailWithError: expectedError)
            } else if let expectedLocation = expectedLocation {
                delegate?.locationManager?(self, didUpdateLocations: [expectedLocation])
            }
        }
        
        override func stopUpdatingLocation() {
            stopUpdatingLocationDidCalled = true
        }
    }
}
