//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Yosemite on 1/15/15.
//  Copyright (c) 2015 Yosemite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var goNumber = 1
    
    // 0-empty, 1-nought, 2-cross
    var gameState = [0, 0, 0,
                     0, 0, 0,
                     0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                               [0, 3, 6], [1, 4, 7], [2, 5, 8],
                               [0, 4, 8], [2, 4, 6]]
    
    var winner = 0
    
    @IBOutlet weak var button0: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var blurredView: UIVisualEffectView!
    
    @IBOutlet weak var resetButtonLabel: UIButton!
    
    
    @IBAction func buttonPressed(sender: UIButton) {
        var allOccupied = true
        var image:UIImage?
        
        if gameState[sender.tag] == 0 && winner == 0 {
            if goNumber % 2 == 0 {
                image = UIImage(named: "cross")
                gameState[sender.tag] = 2
            } else {
                image = UIImage(named: "nought")
                gameState[sender.tag] = 1
            }
            
            goNumber++
            
            sender.setImage(image, forState: UIControlState.Normal)
            sender.alpha = 0
            
            // Add finishi point for button animation to fade in
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                sender.alpha = 1
            })

            for combination in winningCombinations {
                if gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[0]] != 0 {
                    winner = gameState[combination[0]]
                }
            }
        }
        
        for states in gameState {
            if states == 0 {
                allOccupied = false
            }
        }
        
        if winner != 0 || (winner == 0 && allOccupied) {
            blurredView.hidden = false
            
            if winner == 1 {
                resultLabel.text = "Noughts has won!\nTry again?"
            } else if winner == 2 {
                resultLabel.text = "Cross has won!\nTry again?"
            } else {
                resultLabel.text = "Tie game!\nTry again?"
            }
            
            // Add finishi point for text animation to fly in
            UIView.animateWithDuration(2, animations: { () -> Void in
                self.resultLabel.center = CGPointMake(self.resultLabel.center.x + 400, self.resultLabel.center.y)
            })
            
            // Add finishi point for button animation to fade in
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.resetButtonLabel.alpha = 1
            })
        }

    }
    
    @IBAction func resetButtonPressed(sender: UIButton) {
        winner = 0
        gameState = [0, 0, 0,
                     0, 0, 0,
                     0, 0, 0]
        goNumber = 1
        
        // Locate all the buttons with "viewWithTag"
        for var tag = 0; tag < 9; tag++ {
            var button:UIButton = self.view.viewWithTag(tag) as UIButton
            button.setImage(nil, forState: UIControlState.Normal)
        }

        
        blurredView.hidden = true
        resultLabel.center = CGPointMake(resultLabel.center.x - 400, resultLabel.center.y)
        resetButtonLabel.alpha = 0
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        resultLabel.center = CGPointMake(resultLabel.center.x - 400, resultLabel.center.y)
        resetButtonLabel.alpha = 0
        
    }


}

