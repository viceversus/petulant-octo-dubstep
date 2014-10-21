//
//  NewPlayerController.swift
//  petulant-octo-dubstep
//
//  Created by Rob Pak on 10/21/14.
//  Copyright (c) 2014 viceversus. All rights reserved.
//

import UIKit

class NewPlayerController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var monsterName: UILabel!
    var monster: PODMonster!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignMonster()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func nameEntered(textField: UITextField) {
        println("name entered \(textField.text)")
        GameMaster.addPlayer(textField.text, monster: monster)
        
        performSegueWithIdentifier("TabBarSegue", sender: self)
    }
    
    func assignMonster() {
        monster = GameMaster.reserveMonster()
        monsterName.text = monster.name
    }
}
