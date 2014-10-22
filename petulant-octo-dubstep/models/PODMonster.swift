//
//  Monster.swift
//  petulant-octo-dubstep
//
//  Created by Chad Jablonski on 10/21/14.
//  Copyright (c) 2014 viceversus. All rights reserved.
//

import Foundation
import CoreLocation

class PODMonster {
    var location: CLLocation
    var name: NSString!
    var owner: PODPlayer?
    var health: Int
    var spriteName: String
    
    init(name: NSString) {
        self.health = 100
        self.location = CLLocation(latitude: CLLocationDegrees(37.78), longitude: CLLocationDegrees(-122.3))
        self.name = name
        self.spriteName = "afrog.png"
    }
    
    init(name: NSString, player: PODPlayer) {
        self.health = 120
        self.location = player.location!
        self.name = name
        self.owner = player
        self.spriteName = "afrog.png"
    }
    
    func attack(target: PODMonster) {
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