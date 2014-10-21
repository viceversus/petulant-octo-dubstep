//
//  Monster.swift
//  petulant-octo-dubstep
//
//  Created by Chad Jablonski on 10/21/14.
//  Copyright (c) 2014 viceversus. All rights reserved.
//

import Foundation
import CoreLocation

class Monster {
    var location: CLLocation
    var health = 0
    
    init() {
        self.health = 100
        self.location = CLLocation(latitude: CLLocationDegrees(37.78), longitude: CLLocationDegrees(-122.3))
    }
    
    func attack(target: Monster) {
        target.takeDamage(10)
    }
    
    func takeDamage(value: Int) {
        self.health -= value
        if self.isDead() {
            self.health = 0
        }
    }
    
    func isDead() -> Bool {
        return self.health <= 0
    }
}