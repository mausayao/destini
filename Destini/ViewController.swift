//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Our strings
    let story1 = "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\"."
    let answer1a = "I\'ll hop in. Thanks for the help!"
    let answer1b = "Better ask him if he\'s a murderer first."
    
    
    let story2 = "He nods slowly, unphased by the question."
    let answer2a = "At least he\'s honest. I\'ll climb in."
    let answer2b = "Wait, I know how to change a tire."
    
    let story3 = "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box."
    let answer3a = "I love Elton John! Hand him the cassette tape."
    let answer3b = "It\'s him or me! You take the knife and stab him."
    
    let story4 = "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?"
    let story5 = "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in."
    let story6 = "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\""
    
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    // TODO Step 5: Initialise instance variables here
    var take = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        takes()
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == 1 {
           takeADecision()
        } else {
           takeBDecision()
        }
        takes()
    }
    
    func takeADecision() {
        if topButton.titleLabel?.text == answer1a {
            take = 3
        }
        
        if topButton.titleLabel?.text == answer2a {
            take = 3
        }
        
        if topButton.titleLabel?.text == answer3a {
            take = 6
        }
    }
    
    func takeBDecision() {
        if bottomButton.titleLabel?.text == answer1b {
            take = 2
        }
        
        if bottomButton.titleLabel?.text == answer2b {
            take = 4
        }
        
        if bottomButton.titleLabel?.text == answer3b {
            take = 5
        }
    }
    
    func takes() {
        switch take {
        case 1:
            storyTextView.text = story1
            topButton.setTitle(answer1a, for: .normal)
            bottomButton.setTitle(answer1b, for: .normal)
        case 2:
            storyTextView.text = story2
            topButton.setTitle(answer2a, for: .normal)
            bottomButton.setTitle(answer2b, for: .normal)
        case 3:
            storyTextView.text = story3
            topButton.setTitle(answer3a, for: .normal)
            bottomButton.setTitle(answer3b, for: .normal)
        case 4:
            storyTextView.text = story4
            alert()
        case 5:
            storyTextView.text = story5
            alert()
        case 6:
            storyTextView.text = story6
            alert()
        default:
            storyTextView.text = story1
            topButton.setTitle(answer1a, for: .normal)
            bottomButton.setTitle(answer1b, for: .normal)
        }
        
    }
    
    func alert() {
        let alert = UIAlertController(title: "The story is over", message: "You finish the game", preferredStyle: .actionSheet)
        
        let action =  UIAlertAction(title: "Ok", style: .default, handler: {(action) in self.endStory()})
        
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    

    func endStory() {
        take = 1
        takes()
    }

}

