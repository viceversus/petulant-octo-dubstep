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
    
    var scene: BattlefieldScene!
    var spriteView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var battlefield = PODBattlefield()
        // Do any additional setup after loading the view, typically from a nib
        
        // Configure the view.
        self.spriteView = SKView(frame: CGRectMake(0.0, 0.0, 1024.0, 768.0))
        self.spriteView.showsFPS = true
        self.spriteView.showsNodeCount = true
            
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        self.spriteView.ignoresSiblingOrder = true
        self.view.addSubview(self.spriteView)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.scene = BattlefieldScene()
        
        /* Set the scale mode to scale to fit the window */
        self.scene.scaleMode = .AspectFill
        self.scene.size = spriteView.bounds.size
        self.spriteView.presentScene(scene)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func attack(sender: AnyObject) {
        println("ATTACK!")
    }
}
