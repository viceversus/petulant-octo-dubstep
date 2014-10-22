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
    
    init(name: String, monster: PODMonster) {
        locationManager = CLLocationManager()
        location = locationManager.location
        self.name = name
        monsters.append(monster)
    }
    
    init(artificialPlayer: Bool) {
        locationManager = CLLocationManager()
        location = locationManager.location
        var monster = GameMaster.reserveMonster()
        monsters.append(monster)
    }
    
    func isEqual(other: AnyObject) -> Bool {
        if self === other {
            return true
        }

        return false
    }
    
    func currentMonster() -> PODMonster {
        return monsters[0]
    }
}
