
//
//  ViewController.swift
//  Trivia
//
//  Created by Kendall Poindexter on 8/23/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.



// Create a trivia game application consisting of at least 8 questions
// If the user guesses a question correctly, the background of the app should flash green, and the user should be taken to the next question
// If the user chooses an incorrect answer, the background of the app should flash red, and that answer should be disabled
// If the user gets more than 3 questions wrong, the user should lose the game
// At the end of the game, your app should show the user their score
// The user should be able to start over when the game ends

import UIKit

class TriviaViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var outputQuestions: UILabel!
    @IBOutlet weak var userAnswer: UITextField!
    @IBOutlet weak var outputScore: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    // MARK: - Properties
    
    var questionsAndAnswers: [(question: String, answer: String)] = [
        (question: "What is the biggest land animal on Earth?", answer: "elephant"),
        (question: "What is the fastest animal on Earth?", answer: "cheetah"),
        (question: "What is the largest rodent in the world?", answer: "capybara"),
        (question: "What is the largest lizard on Earth", answer: "komodo dragon"),
        (question: "What is the largest marine mammal on Earth", answer: "blue whale"),
        (question: "What is the largest fish on Earth", answer: "great white shark"),
        (question: "What is the slowest animal on Earth", answer: "three toed sloth"),
        (question: "What is the fastest bird on foot", answer: "ostrich")
    ]
    
    var roundQnA: [(question: String, answer: String)] = [
        (question: "What is the biggest land animal on Earth?", answer: "elephant"),
        (question: "What is the fastest animal on Earth?", answer: "cheetah"),
        (question: "What is the largest rodent in the world?", answer: "capybara"),
        (question: "What is the largest lizard on Earth", answer: "komodo dragon"),
        (question: "What is the largest marine mammal on Earth", answer: "blue whale"),
        (question: "What is the largest fish on Earth", answer: "great white shark"),
        (question: "What is the slowest animal on Earth", answer: "three toed sloth"),
        (question: "What is the fastest bird on foot", answer: "ostrich")
    ]
    
    var randomIndex = 0
    var score = 0
    var wrongAnswer = 0
    var shouldUpdateQuestion = true
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        outputRandomQ()
    }
    
    // MARK: - Methods
    
    func generateRandomNumber() -> Int {
        return Int(arc4random_uniform(UInt32(roundQnA.count)))
    }
    
    func outputRandomQ() {
        if roundQnA.count < 1 {
            return
        }
        
        // Step 1: Recalculate randomIndex
        randomIndex = generateRandomNumber()
        
        // Step 2: Pick new QnA with randomIndex
        let randomQuestion = roundQnA[randomIndex].question
        
        outputQuestions.text = randomQuestion
    }
    
    func removeSeenQnA() {
        // Remove the QnA that we just saw
        roundQnA.remove(at: randomIndex)
    }
    
    func isAnswerCorrect() -> Bool {
        let answer = roundQnA[randomIndex].answer
        
        //Unwrap this optional
        guard let unwrapUserAnswerText = userAnswer.text?.lowercased().trimmingCharacters(in: .whitespaces) else {
            return false
        }
        
        if answer == unwrapUserAnswerText {
            return true
        } else {
            return false
        }
    }
    
    func updateQuestion() {
        userAnswer.text = ""
        
        if shouldUpdateQuestion == false {
            return
        }
        
        if roundQnA.count > 1 {
            removeSeenQnA()
            outputRandomQ()
        } else {
            return
        }
    }
    
    func flashGreen() {
        UIView.animate(withDuration: (0.5), animations: {
            self.view.backgroundColor = UIColor.green
        }, completion: { (didAnimateGreen) in
            if didAnimateGreen == true {
                self.view.backgroundColor = UIColor.white
            }
        })
    }
    
    func flashRed() {
        UIView.animate(withDuration: (0.5), animations: {
            self.view.backgroundColor = UIColor.red
        }) { (didAnimateRed) in
            if didAnimateRed == true {
                self.view.backgroundColor = UIColor.white
            }
        }
    }
    
    func notifyUserOfResults() {
        if isAnswerCorrect() == true {
            flashGreen()
            score+=1
        }
        
        if isAnswerCorrect() == false {
            flashRed()
            wrongAnswer+=1
        }
        
        if wrongAnswer > 3 {
            outputQuestions.text = "You Lose"
            submitButton.isEnabled = false
            shouldUpdateQuestion = false
        } else if score >= 5 && roundQnA.count == 1 {
            outputScore.text = String(score)
            outputQuestions.text = "You Win"
            submitButton.isEnabled = false
            shouldUpdateQuestion = false
        }
    }
    
    //MARK: - Actions
   
    @IBAction func submitTapped(_ sender: UIButton) {
        notifyUserOfResults()
        updateQuestion()
    }
   
    @IBAction func resetButton(_ sender: UIButton) {
        roundQnA = questionsAndAnswers
        wrongAnswer = 0
        score = 0
        userAnswer.text = ""
        outputScore.text = ""
        submitButton.isEnabled = true
        outputRandomQ()
        shouldUpdateQuestion = true
    }
}
