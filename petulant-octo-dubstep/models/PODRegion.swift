//
//  Region.swift
//  petulant-octo-dubstep
//
//  Created by Chad Jablonski on 10/21/14.
//  Copyright (c) 2014 viceversus. All rights reserved.
//

import Foundation
import CoreLocation

class PODRegion {
    var location:CLLocation!
    var radius = CLLocationDistance(150)

    init(latitude: Double, longitude: Double) {
        self.location = CLLocation(latitude: latitude as CLLocationDegrees, longitude: longitude as CLLocationDegrees)
    }
}
