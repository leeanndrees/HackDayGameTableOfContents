//
//  ViewController.swift
//  HackDayGameTableOfContents
//
//  Created by DetroitLabs on 8/28/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

class ToCViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToCItem", for: indexPath)
        
        return cell
    }

}

