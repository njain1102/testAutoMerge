//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimer = ["Soft" : 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var secondsPassed = 0
    var totalTime = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        //invalidate() to stop the timer.
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimer[hardness]!
        progressBar.progress = 0.0
        titleLabel.text = hardness
        secondsPassed = 0
        debugPrint(secondsPassed)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDownTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func countDownTimer(){
        if secondsPassed<totalTime {
            secondsPassed+=1
            progressBar.progress = (Float(secondsPassed)/Float(totalTime))
            
        }else{
            timer.invalidate()
            titleLabel.text = "Done with Eggs!"
            print("still running")
            
        }
    }
    
}
