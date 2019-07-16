//
//  ViewController.swift
//  timeExample
//
//  Created by Memin on 16.07.2019.
//  Copyright © 2019 Memin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0
    var time = 3
    var target = 5
    var timer = Timer()
    
    @IBOutlet weak var Time: UILabel!
    @IBOutlet weak var Target: UILabel!
    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var failText: UILabel!
    @IBOutlet weak var successText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // This code calls Update function every 1 second
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.Update)), userInfo: nil, repeats: true)
        Target.text = "Target: " + String(target)
        self.successText.alpha = 0.0 // This code hides Success Text at the beginning of the game
        self.failText.alpha = 0.0 // This code hides Fail Text at the beginning of the game
    }
    
    @IBAction func BtnAction(_ sender: Any) {
        score += 1
        Score.text = "Score: " + String(score)
    }
   
    @objc func Update(){
        time -= 1
        Time.text = "Time: " + String(time)
        
        if time == 0{
            Time.text = "Tİme: 0"
            timer.invalidate()
          
            if score >= target {
                self.successText.alpha = 1.0 // This code Show Success Text, if score equal or bigger than target
            }
            else {
                self.failText.alpha = 1.0 // This code Show Fail Text if score smaller than target
            }
        }
    }
}

