//
//  ViewController.swift
//  FastTapper
//
//  Created by Kendall Poindexter on 8/17/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class FTViewController: UIViewController {
    
    @IBOutlet weak var numberOfTaps: UILabel!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var winOrLose: UILabel!
    @IBOutlet weak var disableButton: UIButton!
    
    
    var tap = 0
    var isTimerStarted = false
    var countdownTimer: Timer!
    var totalTime = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    

    /// Starts the timer
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        // timer is now started
        isTimerStarted = true
    }
    
    /// Decrements timer by one and updates the timer label
    @objc func updateTime() {
        
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
            disableButton.isEnabled = false
            if tap >= 50 {
                winOrLose.text = "You win!!!"
            } else {
                winOrLose.text = "Try Again!!!"
            }
        }
        timer.text = "\(totalTime)"
    }
    
    func endTimer() {
        countdownTimer.invalidate()
        // timer is not started
        isTimerStarted = false
    }
    

    
    @IBAction func score(_ sender: UIButton) {
        // literally want tap to increase by 1 every time the button is pressed
        tap+=1
        let convertTap = String(tap)
        numberOfTaps.text = convertTap
        // want timer to start with intial button press then not restart
        if isTimerStarted == false {
            startTimer()
        }
        
    }
    
    
    //Reset game functionality
    // I want when the timer reaches zero to reset the score to zero
    
    @IBAction func resetTimerAndScore(_ sender: Any) {
        tap = 0
        numberOfTaps.text = String(tap)
        // Placed so that timer ends and resets each time.
        endTimer()
        totalTime = 30
        timer.text = String(totalTime)
        winOrLose.text = "Play!"
        disableButton.isEnabled = true
        
        
        
    }
    
    
}

