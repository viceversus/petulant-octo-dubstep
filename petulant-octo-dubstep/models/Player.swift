//
//  Player.swift
//  petulant-octo-dubstep
//
//  Created by Chad Jablonski on 10/21/14.
//  Copyright (c) 2014 viceversus. All rights reserved.
//

import Foundation
import CoreLocation


class Player {
    var locationManager: CLLocationManager!
    var location: CLLocation
    
    init() {
        location = locationManager.location
    }
}
