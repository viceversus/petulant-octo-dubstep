//
//  GameMaster.swift
//  petulant-octo-dubstep
//
//  Created by Rob Pak on 10/21/14.
//  Copyright (c) 2014 viceversus. All rights reserved.
//

import Foundation

class GameMaster {
    var players:[Player] = []
    
    func addPlayer(name:NSString) -> Player {
        var player = Player()
        player.name = name
        World.players.append(player)

        return player
    }
}