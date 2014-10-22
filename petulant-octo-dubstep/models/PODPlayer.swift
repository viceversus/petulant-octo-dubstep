//
//  Player.swift
//  petulant-octo-dubstep
//
//  Created by Chad Jablonski on 10/21/14.
//  Copyright (c) 2014 viceversus. All rights reserved.
//

import Foundation
import CoreLocation

class PODPlayer {
    var locationManager: CLLocationManager!
    var location: CLLocation?
    var name: String?
    var monsters: [PODMonster] = []
    var currentMonster: PODMonster
    
    init(name: String, monster: PODMonster) {
        locationManager = CLLocationManager()
        location = locationManager.location
        currentMonster = monster
        monsters.append(monster)
        self.name = name
    }
}
