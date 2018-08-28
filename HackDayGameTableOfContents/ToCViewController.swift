//
//  ViewController.swift
//  HackDayGameTableOfContents
//
//  Created by DetroitLabs on 8/28/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

class ToCViewController: UITableViewController {

    var gamesList = ["Faster Tapper", "Math Practice", "Nature Trivia!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Choose a Game:"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToCItem", for: indexPath)
        
        cell.textLabel?.text = gamesList[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let segueIdentifier: String
        switch indexPath.row {
        case 0:
            segueIdentifier = "FTSegue"
        case 1:
            segueIdentifier = "MathSegue"
        case 2:
            segueIdentifier = "TriviaSegue"
        default:
            segueIdentifier = "MathSegue"
        }
        
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }

}

