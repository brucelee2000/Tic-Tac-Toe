# Tic-Tac-Toe
Identify elements (label/button/image) by its TAG
-------------------------------------------------
* **Check each tag for target element**

        @IBAction func buttonPressed(sender: UIButton) {
            var allOccupied = true
            var image:UIImage?
            
            if gameState[sender.tag] == 0 && winner == 0 {...}

* **Go through all the sane elements by referring their tags**      

        // Locate all the buttons with "viewWithTag"
        for var tag = 0; tag < 9; tag++ {
            var button:UIButton = self.view.viewWithTag(tag) as UIButton
            button.setImage(nil, forState: UIControlState.Normal)
        }

Animating views with its elements (label/button/image)
------------------------------------------------------
* **Step1. Set initial position/transparency for the element.**

  Eg. "Fly in" means the initial position is out of current view border
  
        resultLabel.center = CGPointMake(resultLabel.center.x - 400, resultLabel.center.y)
        resetButtonLabel.alpha = 0
        
        resultLabel.center = CGPointMake(resultLabel.center.x - 400, resultLabel.center.y)
        resetButtonLabel.alpha = 0
        
* **Step2. Set finished position/transparency for the element.**

        // Add finishi point for text animation to fly in
        UIView.animateWithDuration(2, animations: { () -> Void in
            self.resultLabel.center = CGPointMake(self.resultLabel.center.x + 400, self.resultLabel.center.y)
        })
            
        // Add finishi point for button animation to fade in
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.resetButtonLabel.alpha = 1
        })
        

