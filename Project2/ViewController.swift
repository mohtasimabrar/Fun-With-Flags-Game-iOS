//
//  ViewController.swift
//  Project2
//
//  Created by Mohtasim Abrar Samin on 17/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
        button1.layer.shadowColor = UIColor.black.cgColor
        button1.layer.shadowOffset = CGSize(width: 0, height: 0)
        button1.layer.shadowRadius = 5
        button1.layer.shadowOpacity = 0.2
        
        button2.layer.shadowColor = UIColor.black.cgColor
        button2.layer.shadowOffset = CGSize(width: 0, height: 0)
        button2.layer.shadowRadius = 5
        button2.layer.shadowOpacity = 0.2
        
        button3.layer.shadowColor = UIColor.black.cgColor
        button3.layer.shadowOffset = CGSize(width: 0, height: 0)
        button3.layer.shadowRadius = 5
        button3.layer.shadowOpacity = 0.2
        
        button4.layer.shadowColor = UIColor.black.cgColor
        button4.layer.shadowOffset = CGSize(width: 0, height: 0)
        button4.layer.shadowRadius = 5
        button4.layer.shadowOpacity = 0.2
        
        
        
        askQuestion()
    }
    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        button4.setImage(UIImage(named: countries[3]), for: .normal)
        
        title = "Guess the flag of: "+countries[correctAnswer].uppercased()+" | Score: "+String(score)
    }
    
    func reset(action: UIAlertAction! = nil){
        score = 0
        correctAnswer = 0
        questionAsked = 0
        
        askQuestion()
    }

    @IBAction func onButtonPress(_ sender: UIButton) {
        var title: String
        
        if questionAsked < 9{
            if sender.tag == correctAnswer {
                title = "Correct"
                score += 1
            } else {
                title = "Wrong! That is the flag of "+countries[sender.tag].uppercased()
                score -= 1
            }
            
            questionAsked += 1
            
            let ac = UIAlertController(title: title, message: "Your Score is \(score)/\(questionAsked)", preferredStyle: .alert)
        
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            ac.addAction(UIAlertAction(title: "Reset Game", style: .default, handler: reset))
            
            present(ac, animated: true)
        } else {
            if sender.tag == correctAnswer {
                score += 1
            } else {
                score -= 1
            }
            let ac = UIAlertController(title: "Result", message: "Your Final Score is \(score)/10", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Finish", style: .default, handler: reset))
            
            present(ac, animated: true)
        }
        
        
        
    }
    
}

