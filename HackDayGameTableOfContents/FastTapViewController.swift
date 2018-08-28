//
//  ViewController.swift
//  FastTapper
//
//  Created by Kendall Poindexter on 8/17/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class FTViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var numberOfTaps: UILabel!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var winOrLose: UILabel!
    @IBOutlet weak var disableButton: UIButton!
    
    //MARK: - Properties
    
    var tap = 0
    var isTimerStarted = false
    var countdownTimer: Timer!
    var totalTime = 30
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Methods
    
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
                gameAlertWin()
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
    
    func gameAlertWin() {
        let alert = UIAlertController(title: "Times Up", message: "You Win", preferredStyle: .alert)
        let startOverAction = UIAlertAction(title: "Start Over", style: .destructive, handler: restartGame)
        let quit = UIAlertAction(title: "Quit", style: .cancel, handler: nil)
        
        alert.addAction(startOverAction)
        alert.addAction(quit)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func restartGame(userAction: UIAlertAction) {
        tap = 0
        numberOfTaps.text = String(tap)
        // Placed so that timer ends and resets each time.
        endTimer()
        totalTime = 30
        timer.text = String(totalTime)
        winOrLose.text = "Play!"
        disableButton.isEnabled = true
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

