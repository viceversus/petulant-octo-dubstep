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
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = SKColor.blueColor()
        let background = SKSpriteNode(imageNamed: "afrog.png")
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.size = CGSizeMake(200, 200)
        background.position = CGPointMake(100, 100)
        background.zPosition = -2
        self.addChild(background)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
}
