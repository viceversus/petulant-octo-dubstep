//
//  GameMaster.swift
//  petulant-octo-dubstep
//
//  Created by Rob Pak on 10/21/14.
//  Copyright (c) 2014 viceversus. All rights reserved.
//

import Foundation

class GameMaster {
    var players:[PODPlayer] = []

    class func addPlayer(name: NSString, monster: PODMonster) -> PODPlayer {
        var player = PODPlayer(name: name, monster: monster)
        World.players.append(player)

        return player
    }
    
    class func reserveMonster() -> PODMonster {
        let monsterIndexUpperBound = UInt32(World.monsters.count - 1)
        let monsterIndex = Int(arc4random_uniform(monsterIndexUpperBound))
        let monster = World.monsters[monsterIndex]
        World.activeMonsters.append(monster)
        
        return monster
    }
}
