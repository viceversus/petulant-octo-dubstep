//
//  BattleViewController.swift
//  petulant-octo-dubstep
//
//  Created by Chad Jablonski on 10/21/14.
//  Copyright (c) 2014 viceversus. All rights reserved.
//

import UIKit
import SpriteKit

class BattleViewController: UIViewController {
    @IBOutlet weak var attackButton: UIBarButtonItem!
    @IBOutlet weak var runButton: UIBarButtonItem!
    var battleEngine: PODBattleEngine = PODBattleEngine()
    var battlefield: PODBattlefield!
    
    var scene: BattlefieldScene!
    var spriteView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view.
        self.spriteView = SKView(frame: CGRectMake(0.0, 0.0, 1024.0, 525.0))
        self.spriteView.showsFPS = true
        self.spriteView.showsNodeCount = true
            
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        self.spriteView.ignoresSiblingOrder = true
        self.view.addSubview(self.spriteView)
        
        var userPlayer: PODPlayer = World.players[0]
        var artificialPlayer: PODPlayer = PODPlayer(artificialPlayer: true)
        battlefield = PODBattlefield(player1: userPlayer, player2: artificialPlayer)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.scene = BattlefieldScene()
        self.scene.createPlayerMonster(battlefield.player1)
        self.scene.createEnemyMonster(battlefield.player1)
        
        /* Set the scale mode to scale to fit the window */
        self.scene.scaleMode = .AspectFill
        self.scene.size = spriteView.bounds.size
        self.spriteView.presentScene(scene)
    }
    
    @IBAction func attack(sender: UIBarButtonItem) {
        if battlefield.actingPlayer.isEqual(battlefield.player1) {
            battleEngine.attack(battlefield, combatant: battlefield.player1, recipient: battlefield.player2)
            self.scene.playerMonsterAttack()
            simulateTick()
            
        }
    }
    
    @IBAction func run(sender: UIBarButtonItem) {
        if battlefield.actingPlayer.isEqual(battlefield.player1) {
            battleEngine.run(battlefield)
        }
        self.performSegueWithIdentifier("unwindToMap", sender: self)
    }
    
    func simulateTick() {
        if !battleEngine.battleEnded {
            battleEngine.simulateAttack(battlefield, combatant: battlefield.player2, recipient: battlefield.player1)
            self.scene.enemyMonsterAttack()
            if battleEngine.battleEnded {
                self.userBattleEnded("You Lost")
            }
        } else {
            self.userBattleEnded("You Won")
        }
    }
    
    func userBattleEnded(message: String) {
        var alert = UIAlertController(title: "Battle Over", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(
            title: "Leave Battle",
            style: UIAlertActionStyle.Default,
            handler: {(alert: UIAlertAction!) in
                self.performSegueWithIdentifier("unwindToMap", sender: self)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
