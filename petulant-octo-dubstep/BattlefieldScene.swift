//
//  BattlefieldScene.swift
//  petulant-octo-dubstep
//
//  Created by Chad Jablonski on 10/21/14.
//  Copyright (c) 2014 viceversus. All rights reserved.
//

import Foundation
import SpriteKit

class BattlefieldScene : SKScene {

    var battlefield: PODBattlefield!
    var contentCreated = false
    var playerMonster: SKSpriteNode!
    var enemyMonster: SKSpriteNode!
    var idleAnimation: SKAction!
    var frames: [SKAction]!
    var enemyDamage: SKLabelNode!
    var playerDamage: SKLabelNode!

    func createPlayerMonster(player: PODPlayer) {
        let monster    = World.players[0].currentMonster()
        let spriteName = monster.imageGroup

        let delay = 0.1
        frames = []
        for frame in monster.idleFrames() {
            frames.append(SKAction.setTexture(SKTexture(imageNamed: frame)))
            frames.append(SKAction.waitForDuration(delay))
        }
        idleAnimation = SKAction.sequence(frames)

        self.backgroundColor = SKColor.whiteColor()
        self.playerMonster = SKSpriteNode(imageNamed: spriteName)
        self.playerMonster.anchorPoint = CGPoint(x: 0, y: 0)
        self.playerMonster.size = CGSizeMake(150, 150)
        self.playerMonster.position = CGPointMake(100, 25)
        self.playerMonster.zPosition = -2
        self.addChild(playerMonster)
        playerMonster.runAction(SKAction.repeatActionForever(idleAnimation));
    }

    func createEnemyMonster(player: PODPlayer) {
        let spriteName = player.currentMonster().imageGroup

        self.backgroundColor = SKColor.whiteColor()
        self.enemyMonster = SKSpriteNode(imageNamed: spriteName)
        self.enemyMonster.anchorPoint = CGPoint(x: 0, y: 0)
        self.enemyMonster.size = CGSizeMake(100, 100)
        self.enemyMonster.position = CGPointMake(100, 300)
        self.enemyMonster.zPosition = -2
        self.addChild(enemyMonster)
    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }


    func attackAnimation(sprite: SKSpriteNode) {
        let shake = SKAction.shake(sprite.position, duration: 0.5, amplitudeX: 12, amplitudeY: 3)
        sprite.runAction(shake)
    }


    func playerMonsterAttack(damage: Int) {
        playerDamage?.removeFromParent()
        playerDamage = SKLabelNode()
        playerDamage.text = String(damage)
        playerDamage.position = CGPointMake(250, 100)
        playerDamage.fontColor = SKColor.redColor()
        playerDamage.fontName = "TrebuchetMS-Bold"
        self.addChild(playerDamage)
        attackAnimation(playerMonster)
    }

    func enemyMonsterAttack(damage: Int) {
        enemyDamage?.removeFromParent()
        enemyDamage = SKLabelNode()
        enemyDamage.text = String(damage)
        enemyDamage.position = CGPointMake(50, 300)
        enemyDamage.fontColor = SKColor.redColor()
        enemyDamage.fontName = "TrebuchetMS-Bold"
        self.addChild(enemyDamage)
        attackAnimation(enemyMonster)
    }
}


extension SKAction {
    class func shake(initialPosition:CGPoint, duration:Float, amplitudeX:Int = 12, amplitudeY:Int = 3) -> SKAction {
        let startingX = initialPosition.x
        let startingY = initialPosition.y
        let numberOfShakes = duration / 0.015
        var actionsArray:[SKAction] = []
        for index in 1...Int(numberOfShakes) {
            let newXPos = startingX + CGFloat(arc4random_uniform(UInt32(amplitudeX))) - CGFloat(amplitudeX / 2)
            let newYPos = startingY + CGFloat(arc4random_uniform(UInt32(amplitudeY))) - CGFloat(amplitudeY / 2)
            actionsArray.append(SKAction.moveTo(CGPointMake(newXPos, newYPos), duration: 0.015))
        }
        actionsArray.append(SKAction.moveTo(initialPosition, duration: 0.015))
        return SKAction.sequence(actionsArray)
    }
}
