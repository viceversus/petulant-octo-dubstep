//
//  PODBattleEngine.swift
//  petulant-octo-dubstep
//
//  Created by Ken Shimizu on 10/21/14.
//  Copyright (c) 2014 viceversus. All rights reserved.
//

import Foundation

class PODBattleEngine {
    var battleEnded: Bool = false
    
    func run(battlefield: PODBattlefield) {
        
    }
    
    func attack(battlefield: PODBattlefield, combatant: PODPlayer, recipient: PODPlayer) -> Int {
        let damage = calculateDamage()
        combatant.currentMonster().giveDamage(recipient.currentMonster(), damage:damage)
        NSLog("combatant hp is: \(combatant.currentMonster().health)")
        NSLog("recipient hp is: \(recipient.currentMonster().health)")
        if (recipient.currentMonster().isDead()) {
            battleEnded = true
        }
        battlefield.switchActingPlayer()
        return damage
    }
    
    func simulateAttack(battlefield: PODBattlefield, combatant: PODPlayer, recipient: PODPlayer) -> Int {
        let damage = calculateDamage()
        combatant.currentMonster().giveDamage(recipient.currentMonster(), damage:calculateDamage())
        NSLog("combatant hp is: \(combatant.currentMonster().health)")
        NSLog("recipient hp is: \(recipient.currentMonster().health)")
        if (recipient.currentMonster().isDead()) {
            battleEnded = true
        }
        battlefield.switchActingPlayer()
        return damage
    }
    
    private func calculateDamage() -> Int {
        return Int(arc4random_uniform(5)) + 10
    }
}