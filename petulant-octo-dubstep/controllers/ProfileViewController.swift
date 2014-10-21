//
//  SecondViewController.swift
//  petulant-octo-dubstep
//
//  Created by Ken Shimizu on 10/21/14.
//  Copyright (c) 2014 viceversus. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var monstersTable: UITableView!
    var monsters: [PODMonster] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMonsters()
        self.monstersTable.delegate = self
        self.monstersTable.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.monsters.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "monsterCell")
        var index = indexPath.row
        var monster = self.monsters[index]
        cell.textLabel.text = monster.name
        cell.detailTextLabel?.text = "\(monster.health)"
        return cell
    }
    
    func createMonsters() {
        for index in 1...6 {
            self.monsters.append(PODMonster(name: "Monster \(index)"));
        }
    }
}

