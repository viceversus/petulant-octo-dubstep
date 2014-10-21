//
//  BattleViewController.swift
//  petulant-octo-dubstep
//
//  Created by Chad Jablonski on 10/21/14.
//  Copyright (c) 2014 viceversus. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController {
    @IBOutlet weak var attackButton: UIBarButtonItem!
    @IBOutlet weak var runButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var battlefield = PODBattlefield()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func attack(sender: AnyObject) {
        println("ATTACK!")
    }
}