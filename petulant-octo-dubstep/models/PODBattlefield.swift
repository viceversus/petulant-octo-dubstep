//
//  Battlefield.swift
//  petulant-octo-dubstep
//
//  Created by Chad Jablonski on 10/21/14.
//  Copyright (c) 2014 viceversus. All rights reserved.
//

import Foundation
import CoreLocation

class PODBattlefield {
    var player1: PODPlayer
    var player2: PODPlayer
    var locationManager: CLLocationManager = CLLocationManager()
    var location: CLLocation
    var actingPlayer: PODPlayer
    
    init(player1: PODPlayer, player2: PODPlayer) {
        self.player1 = player1
        self.player2 = player2
        self.actingPlayer = player1
        self.location = locationManager.location
    }
    
    func switchActingPlayer() {
        if self.player1.isEqual(self.actingPlayer) {
            self.actingPlayer = self.player2
        } else {
            self.actingPlayer = self.player1
        }
    }
}