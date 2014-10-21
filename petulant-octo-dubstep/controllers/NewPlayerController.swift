//
//  NewPlayerController.swift
//  petulant-octo-dubstep
//
//  Created by Rob Pak on 10/21/14.
//  Copyright (c) 2014 viceversus. All rights reserved.
//

import UIKit

class NewPlayerController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func nameEntered(textField: UITextField) {
        println("name entered \(textField.text)")
        var gameMaster:GameMaster = GameMaster()
        gameMaster.addPlayer(textField.text)
    }
}
