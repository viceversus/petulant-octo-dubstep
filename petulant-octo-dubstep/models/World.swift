//
//  World.swift
//  petulant-octo-dubstep
//
//  Created by Rob Pak on 10/21/14.
//  Copyright (c) 2014 viceversus. All rights reserved.
//

import Foundation

struct World {
    static var players:[PODPlayer] = []
    static var enemyRegions:[PODRegion] = [
        PODRegion(latitude: 37.787093, longitude: -122.397177),
        PODRegion(latitude: 37.79, longitude: -122.392),
        PODRegion(latitude: 37.77, longitude: -122.394),
        PODRegion(latitude: 37.76, longitude: -122.406),
        PODRegion(latitude: 37.80, longitude: -122.398),
    ]
}
