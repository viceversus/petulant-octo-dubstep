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
    var originalLocation: CLLocation!
    var name: NSString!
    var owner: PODPlayer?
    var maxHealth: Int
    var health: Int
    var imageGroup: String!
    var idleMode: String!

    init(name: NSString, imageGroup: String, idleMode: String) {
        var locationManager = CLLocationManager()
        self.originalLocation = locationManager.location
        self.health = 100
        self.maxHealth = 100
        self.name = name
        self.imageGroup = imageGroup
        self.idleMode = idleMode
    }

    init(name: NSString, player: PODPlayer, imageGroup: String, idleMode: String) {
        self.health = 120
        self.maxHealth = 120
        self.originalLocation = player.location!
        self.name = name
        self.owner = player
        self.imageGroup = imageGroup
        self.idleMode = idleMode
    }

    func giveDamage(target: PODMonster, damage: Int) {
        target.takeDamage(damage)
    }

    func takeDamage(value: Int) {
        self.health -= value
        if self.isDead() {
            self.health = 0
        }
    }

    func healDamage(value: Int) {
        self.health += value
    }

    func isDead() -> Bool {
        return self.health <= 0
    }

    func spriteName() -> String {
        return "\(imageGroup)-\(idleMode)-a1.png"
    }

    func idleFrames() -> [String] {
        return Array(map(1...8) { "\(self.imageGroup)-\(self.idleMode)-a\($0).png" })
    }
}
