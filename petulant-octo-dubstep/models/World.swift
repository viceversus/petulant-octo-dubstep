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
    static var monsters:[PODMonster] = [
        PODMonster(name: "Scorpibyss", imageGroup: "VillainEgg", idleMode: "Flying"),
        PODMonster(name: "Viperill", imageGroup: "VillainCat", idleMode: "Flying"),
        PODMonster(name: "Charizard", imageGroup: "DarkSkull", idleMode: "Flying"),
        PODMonster(name: "Xatu", imageGroup: "Eagle", idleMode: "Flying"),
        PODMonster(name: "Chimecho", imageGroup: "Dragon", idleMode: "Flying"),
        PODMonster(name: "Kyurem", imageGroup: "GentleBird", idleMode: "Flying"),
        PODMonster(name: "Mareep", imageGroup: "GreenBird", idleMode: "Flying"),
        PODMonster(name: "Patrat", imageGroup: "WhiteParrot", idleMode: "Flying"),
        PODMonster(name: "Combusken", imageGroup: "VillainEgg", idleMode: "Flying"),
        PODMonster(name: "Victreebel", imageGroup: "VillainEgg", idleMode: "Flying"),
        PODMonster(name: "Gigalith", imageGroup: "VillainEgg", idleMode: "Flying"),
        PODMonster(name: "Spiritzee", imageGroup: "VillainEgg", idleMode: "Flying"),
        PODMonster(name: "Aegislash", imageGroup: "VillainEgg", idleMode: "Flying"),
        PODMonster(name: "Excadrill", imageGroup: "VillainEgg", idleMode: "Flying")
    ]
    static var activeMonsters:[PODMonster] = []
}
