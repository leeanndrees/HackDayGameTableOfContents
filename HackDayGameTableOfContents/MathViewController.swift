//
//  ViewController.swift
//  MathPractice3
//
//  Created by DetroitLabs on 8/22/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

/*
 Build an app that allows the user to practice math problems
 Your app should randomly generate an addition, subtraction, multiplication, or division problem and display it on the screen
 Your app should give the user a place to submit their answer, then verify if the answer is correct
 For each correct answer, the user should score 1 point; for each incorrect answer, the user should lose 1 point
 When the user presses a button labeled “End Game,” your app should display the user’s score
 */

import UIKit

class MathViewController: UIViewController {
    
    @IBOutlet weak var mathProblemLabel: UILabel!
    @IBOutlet weak var answerInputField: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    let operands = [2, 10, 20, 40, 4, 80, 100]
    let operators = ["+", "-", "/", "*"]

    var score = 0
    
    static var theMathProblem: (op1: Int, op2: Int, theOperator: String, theProblemString: String)? = nil
    
    func createMathProblem() -> (op1: Int, op2: Int, theOperator: String, theProblemString: String) {
        let op1 = operands[Int(arc4random_uniform(UInt32(operands.count)))]
        let op2 = operands[Int(arc4random_uniform(UInt32(operands.count)))]
        let theOperator = operators[Int(arc4random_uniform(UInt32(operators.count)))]
        let theProblemString = "\(op1) \(theOperator) \(op2)"
        print(theProblemString)
        return (op1: op1, op2: op2, theOperator: theOperator, theProblemString: theProblemString)
    }
    
    func solveMath(op1: Int, theOperator: String, op2: Int) -> Int {
        var answer: Int
        switch theOperator {
        case "+":
            answer = op1 + op2
        case "-":
            answer = op1 - op2
        case "/":
            answer = op1 / op2
        case "*":
            answer = op1 * op2
        default:
            answer = 0
        }
        return answer
    }
    
    func checkMath(rightAnswer: Int, userAnswer: Int) -> Bool {
        
        var gotItRight: Bool
        
        if rightAnswer == userAnswer {
            gotItRight = true
        }
        else {
            gotItRight = false
        }
        return gotItRight
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        MathViewController.theMathProblem = createMathProblem()
        mathProblemLabel.text = MathViewController.theMathProblem?.theProblemString
        
        //let userAnswer = Int(answerInputField.text!)!
        
        scoreLabel.isHidden = false
        
    }
    
    @IBAction func checkButton(_ sender: Any) {
        
        let textFieldText = answerInputField.text!
        let textFieldInt = Int(textFieldText)
        
        let userAnswer = textFieldInt
        
        let rightAnswer = solveMath(op1: MathViewController.theMathProblem!.op1, theOperator: MathViewController.theMathProblem!.theOperator, op2: (MathViewController.theMathProblem?.op2)!)
        
        if (textFieldInt != nil) {
            let wasItRight = checkMath(rightAnswer: rightAnswer, userAnswer: userAnswer!)
                if wasItRight == true {
                    score+=1
                }
                else {
                    score-=1
                }
                viewDidLoad()
            }
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        score = 0
        scoreLabel.isHidden = false
        scoreLabel.text = String(score)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

