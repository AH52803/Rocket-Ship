//
//  GameViewController.swift
//  Rocket Ship
//
//  Created by Anderson Hsiao on 6/6/20.
//  Copyright © 2020 Anderson Hsiao. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    //Initializing the labels, buttons, etc.
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    @IBOutlet weak var engineSwitch: UISwitch!
    @IBOutlet weak var shieldSwitch: UISwitch!
    @IBOutlet weak var speedSelector: UISegmentedControl!
    
    @IBOutlet weak var finishButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        main()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // Game code starts here
    var totalPoints = 0
    let pointsWonOrLost = 10
    var consecutive = 0
    
    var currentTask = ""
    var taskCompleted = true
    var prevPassed = false
    
    var speedChoice = 0
    
    func main() {
        
        //Set up the timer
        var timeLeft = 60.0
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            
            //Timer stuff
            timeLeft -= 0.1
            let timeLeftRounded = Double(round(10*timeLeft)/10)
            self.timerLabel.text = "TIMER\n\(timeLeftRounded)"
            //print("Timer fired! \(timeLeft) seconds left.")
            
            if timeLeft <= 0 {
                
                timer.invalidate()
                self.finishButton.isEnabled = true
                self.instructionsLabel.text = "GAME OVER!"
                
            }
            
            //Game stuff
            if self.taskCompleted {
                self.taskCompleted = false
                
                let randomInt = Int.random(in: 0..<6)
                
                //Engine
                if randomInt == 0 {
                    self.currentTask = "engine"
                    
                    if self.engineSwitch.isOn {
                        self.instructionsLabel.text = "Turn off the engine."
                    }
                    else {
                        self.instructionsLabel.text = "Turn on the engine."
                    }
                }
                    
                //Shield
                else if randomInt == 1 {
                    self.currentTask = "shield"
                    
                    if self.shieldSwitch.isOn {
                        self.instructionsLabel.text = "Turn off the shield."
                    }
                    else {
                        self.instructionsLabel.text = "Turn on the shield."
                    }
                }
                
                //Boost
                else if randomInt == 2 {
                    self.currentTask = "boost"
                    self.instructionsLabel.text = "Activate the boost."
                }
                
                //Laser
                else if randomInt == 3 {
                    self.currentTask = "laser"
                    self.instructionsLabel.text = "Fire the laser."
                }
                
                //Cheese
                else if randomInt == 4 {
                    self.currentTask = "cheese"
                    self.instructionsLabel.text = "Eat some cheese."
                }
                
                //Speed
                else {
                    self.currentTask = "speed"
                    
                    self.speedChoice = Int.random(in: 0...3)
                    
                    if self.speedSelector.selectedSegmentIndex == self.speedChoice {
                        if self.speedChoice == 3 {
                            self.speedChoice -= 1
                        }
                        else {
                            self.speedChoice += 1
                        }
                    }
                    
                    if self.speedChoice == 0 {
                        self.instructionsLabel.text = "Set speed to 0."
                    }
                    else if self.speedChoice == 1 {
                        self.instructionsLabel.text = "Set speed to 1."
                    }
                    else if self.speedChoice == 2 {
                        self.instructionsLabel.text = "Set speed to 2."
                    }
                    else {
                        self.instructionsLabel.text = "Set speed to 3."
                    }
                }
                
                //Update score
                self.pointsLabel.text = "Points\n\(self.totalPoints)"
            }
        }
        

    }
    
    func passed() {
        if !prevPassed {
            consecutive = 0
        }
        
        consecutive += 1
        totalPoints += pointsWonOrLost * consecutive
        prevPassed = true
    }
    
    func failed() {
        if prevPassed {
            consecutive = 0
        }
        
        consecutive += 1
        totalPoints -= pointsWonOrLost * consecutive
        prevPassed = false
    }
    
    
    @IBAction func engineSwitch(_ sender: Any) {
        if currentTask == "engine" {
            passed()
        }
        else {
            failed()
        }
        taskCompleted = true
    }
    
    @IBAction func shieldSwitch(_ sender: Any) {
        if currentTask == "shield" {
            passed()
        }
        else {
            failed()
        }
        taskCompleted = true
    }
    
    @IBAction func boostButton(_ sender: Any) {
        if currentTask == "boost" {
            passed()
        }
        else {
            failed()
        }
        taskCompleted = true
    }
    
    @IBAction func laserButton(_ sender: Any) {
        if currentTask == "laser" {
            passed()
        }
        else {
            failed()
        }
        taskCompleted = true
    }
    
    
    @IBAction func cheeseButton(_ sender: Any) {
        if currentTask == "cheese" {
            passed()
        }
        else {
            failed()
        }
        taskCompleted = true
    }
    
    @IBAction func speedSelector(_ sender: Any) {
        if currentTask == "speed" {
            if speedSelector.selectedSegmentIndex == speedChoice {
                passed()
            }
            else {
                failed()
            }
        }
        else {
            failed()
        }
        taskCompleted = true
    }
}
