//
//  Location.swift
//  abdullahIcon
//
//  Created by abdullah  on 29/05/1441 AH.
//  Copyright © 1441 abdullah . All rights reserved.
//

import UIKit
import CoreLocation

class XLocation : NSObject , CLLocationManagerDelegate {
    static var Shared = XLocation()
    var LocationManager : CLLocationManager!
    func GetMyLocation() {
        
        LocationManager = CLLocationManager()
        LocationManager.delegate = self
        LocationManager.requestWhenInUseAuthorization()
        LocationManager.desiredAccuracy = kCLLocationAccuracyBest
        if CLLocationManager.locationServicesEnabled() {
            LocationManager.startUpdatingLocation()
        }
        
    }
    
    var Longtude : Double = 0
    var Latitude : Double = 0
    var GotLocation : (()->())?
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.Longtude = locations[0].coordinate.longitude
        self.Latitude = locations[0].coordinate.latitude
        GotLocation?()
    }
}

