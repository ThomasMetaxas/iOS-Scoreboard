//
//  HockeyScene.swift
//  Scoreboard
//
//  Created by Thomas Metaxas on 2018-05-04.
//  Copyright © 2018 Thomas Metaxas. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class HockeyScene: SKScene {
    
    var background:SKSpriteNode!
    
    var timeBackground:SKSpriteNode!
    var timeText:SKLabelNode!
    
    var home:SKLabelNode!
    var guest:SKLabelNode!
    
    var homeScoreBackground:SKSpriteNode!
    var guestScoreBackground:SKSpriteNode!
    var homeScore:SKLabelNode!
    var guestScore:SKLabelNode!
    var homeScoreAmount = 0
    var guestScoreAmount = 0
    
    var period:SKLabelNode!
    var periodBackground:SKSpriteNode!
    var periodNumber:SKLabelNode!
    var periodAmount = 0
    var periodOTAmount = 0
    
    var homePlayer:SKLabelNode!
    var guestPlayer:SKLabelNode!
    
    var homePenalty:SKLabelNode!
    var guestPenalty:SKLabelNode!
    
    var homePenaltyOneBackground:SKSpriteNode!
    var homePenaltyTwoBackground:SKSpriteNode!
    var guestPenaltyOneBackground:SKSpriteNode!
    var guestPenaltyTwoBackground:SKSpriteNode!
    var homePlayerOneBackground:SKLabelNode!
    var homePlayerTwoBackground:SKLabelNode!
    var guestPlayerOneBackground:SKLabelNode!
    var guestPlayerTwoBackground:SKLabelNode!
    var homePenaltyPlayerOne:SKLabelNode!
    var homePenaltyPlayerTwo:SKLabelNode!
    var guestPenaltyPlayerOne:SKLabelNode!
    var guestPenaltyPlayerTwo:SKLabelNode!
    var homePenaltyPlayerOneAmount = 0
    var homePenaltyPlayerTwoAmount = 0
    var guestPenaltyPlayerOneAmount = 0
    var guestPenaltyPlayerTwoAmount = 0
    
    var shots:SKLabelNode!
    var shotsHomeBackground:SKSpriteNode!
    var shotsGuestBackground:SKSpriteNode!
    var shotsHomeNumber:SKLabelNode!
    var shotsGuestNumber:SKLabelNode!
    var shotsHomeAmount = 0
    var shotsGuestAmount = 0
    var shotsHome:SKLabelNode!
    var shotsGuest:SKLabelNode!
    
    var homeJersey:SKSpriteNode!
    var guestJersey:SKSpriteNode!
    
    var homePenaltyOne:SKLabelNode!
    var homePenaltyTwo:SKLabelNode!
    var guestPenaltyOne:SKLabelNode!
    var guestPenaltyTwo:SKLabelNode!
    
    var menuButton:SKSpriteNode!
    
    var timePlusButton:SKSpriteNode!
    var timeMinusButton:SKSpriteNode!
    var homeScorePlusButton:SKSpriteNode!
    var homeScoreMinusButton:SKSpriteNode!
    var guestScorePlusButton:SKSpriteNode!
    var guestScoreMinusButton:SKSpriteNode!
    var homeShotsPlusButton:SKSpriteNode!
    var homeShotsMinusButton:SKSpriteNode!
    var guestShotsPlusButton:SKSpriteNode!
    var guestShotsMinusButton:SKSpriteNode!
    var periodPlusButton:SKSpriteNode!
    var periodMinusButton:SKSpriteNode!
    
    var timerHP1 = Timer()
    var timerHP2 = Timer()
    var timerGP1 = Timer()
    var timerGP2 = Timer()
    
    var timeHP1 = 120
    var timeHP2 = 120
    var timeGP1 = 120
    var timeGP2 = 120
    
    var isHomePenaltyOneRunning = false
    var isHomePenaltyTwoRunning = false
    var isGuestPenaltyOneRunning = false
    var isGuestPenaltyTwoRunning = false
    
    var timer = Timer()
    
    var time = 1200
    
    var isTimerRunning = false
    
    var buzzer:SKLabelNode!
    
    var timeSelection:SKLabelNode!
    
    var timerMinutes = 0
    var timerSeconds = 0
    
    var timePicker: UIPickerView = UIPickerView()
    
    var timePickerBackground:SKSpriteNode!
    
    var settingsButton:SKSpriteNode!
    
    var black:SKSpriteNode!
    
    var backButton:SKSpriteNode!
    
    var settingsLabel:SKLabelNode!
    
    var goalBuzzerButton:SKSpriteNode!
    var buzzerButton:SKSpriteNode!
    
    var periodChangeButton:SKSpriteNode!
    
    var goalBuzzerLabel:SKLabelNode!
    var buzzerLabel:SKLabelNode!
    var periodChangeLabel:SKLabelNode!
    
    var homePenaltyOnePlusButton:SKSpriteNode!
    var homePenaltyOneMinusButton:SKSpriteNode!
    var homePenaltyTwoPlusButton:SKSpriteNode!
    var homePenaltyTwoMinusButton:SKSpriteNode!
    
    var homePlayerOnePlusButton:SKSpriteNode!
    var homePlayerOneMinusButton:SKSpriteNode!
    var homePlayerTwoPlusButton:SKSpriteNode!
    var homePlayerTwoMinusButton:SKSpriteNode!
    
    var guestPenaltyOnePlusButton:SKSpriteNode!
    var guestPenaltyOneMinusButton:SKSpriteNode!
    var guestPenaltyTwoPlusButton:SKSpriteNode!
    var guestPenaltyTwoMinusButton:SKSpriteNode!
    
    var guestPlayerOnePlusButton:SKSpriteNode!
    var guestPlayerOneMinusButton:SKSpriteNode!
    var guestPlayerTwoPlusButton:SKSpriteNode!
    var guestPlayerTwoMinusButton:SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        homePenaltyOne = self.childNode(withName: "homePenaltyOne") as? SKLabelNode
        homePenaltyOne.text = timeStringHP1(time: TimeInterval(timeHP1))
        homePenaltyTwo = self.childNode(withName: "homePenaltyTwo") as? SKLabelNode
        homePenaltyTwo.text = timeStringHP2(time: TimeInterval(timeHP2))
        
        guestPenaltyOne = self.childNode(withName: "guestPenaltyOne") as? SKLabelNode
        guestPenaltyOne.text = timeStringGP1(time: TimeInterval(timeGP1))
        guestPenaltyTwo = self.childNode(withName: "guestPenaltyTwo") as? SKLabelNode
        guestPenaltyTwo.text = timeStringGP2(time: TimeInterval(timeGP2))
        
        timeText = self.childNode(withName: "timeText") as? SKLabelNode
        timeText.text = timeString(time: TimeInterval(time))
        
        periodNumber = self.childNode(withName: "periodNumber") as? SKLabelNode
        periodNumber.text = "\(periodAmount)"
        
        homeScore = self.childNode(withName: "homeScore") as? SKLabelNode
        homeScore.text = "\(homeScoreAmount)"
        
        guestScore = self.childNode(withName: "guestScore") as? SKLabelNode
        guestScore.text = "\(guestScoreAmount)"
        
        homeJersey = self.childNode(withName: "homeJersey") as? SKSpriteNode
        guestJersey = self.childNode(withName: "guestJersey") as? SKSpriteNode
        
        menuButton = self.childNode(withName: "menuButton") as? SKSpriteNode
        
        homePenaltyPlayerOne = self.childNode(withName: "homePenaltyPlayerOne") as? SKLabelNode
        homePenaltyPlayerOne.text = "\(homePenaltyPlayerOneAmount)"
        homePenaltyPlayerTwo = self.childNode(withName: "homePenaltyPlayerTwo") as? SKLabelNode
        homePenaltyPlayerTwo.text = "\(homePenaltyPlayerTwoAmount)"
        guestPenaltyPlayerOne = self.childNode(withName: "guestPenaltyPlayerOne") as? SKLabelNode
        guestPenaltyPlayerOne.text = "\(guestPenaltyPlayerOneAmount)"
        guestPenaltyPlayerTwo = self.childNode(withName: "guestPenaltyPlayerTwo") as? SKLabelNode
        guestPenaltyPlayerTwo.text = "\(guestPenaltyPlayerTwoAmount)"
        
        shotsHomeNumber = self.childNode(withName: "shotsHomeNumber") as? SKLabelNode
        shotsHomeNumber.text = "\(shotsHomeAmount)"
        shotsGuestNumber = self.childNode(withName: "shotsGuestNumber") as? SKLabelNode
        shotsGuestNumber.text = "\(shotsGuestAmount)"
        
        timePlusButton = self.childNode(withName: "timePlusButton") as? SKSpriteNode
        timeMinusButton = self.childNode(withName: "timeMinusButton") as? SKSpriteNode
        homeScorePlusButton = self.childNode(withName: "homeScorePlusButton") as? SKSpriteNode
        homeScoreMinusButton = self.childNode(withName: "homeScoreMinusButton") as? SKSpriteNode
        guestScorePlusButton = self.childNode(withName: "guestScorePlusButton") as? SKSpriteNode
        guestScoreMinusButton = self.childNode(withName: "guestScoreMinusButton") as? SKSpriteNode
        homeShotsPlusButton = self.childNode(withName: "homeShotsPlusButton") as? SKSpriteNode
        homeShotsMinusButton = self.childNode(withName: "homeShotsMinusButton") as? SKSpriteNode
        guestShotsPlusButton = self.childNode(withName: "guestShotsPlusButton") as? SKSpriteNode
        guestShotsMinusButton = self.childNode(withName: "guestShotsMinusButton") as? SKSpriteNode
        periodPlusButton = self.childNode(withName: "periodPlusButton") as? SKSpriteNode
        periodMinusButton = self.childNode(withName: "periodMinusButton") as? SKSpriteNode
        
        settingsButton = self.childNode(withName: "settingsButton") as? SKSpriteNode
        
        buzzer = self.childNode(withName: "buzzer") as? SKLabelNode
        buzzer.text = "BUZZER"
        
        timeSelection = self.childNode(withName: "timeSelection") as? SKLabelNode
        timeSelection.text = "TIME"
        
        timePickerBackground = SKSpriteNode(imageNamed: "timePickerBackground")
        timePickerBackground.position = CGPoint(x: 0, y: -self.size.height/2)
        timePickerBackground.size = CGSize(width: self.size.width, height: 900)
        timePickerBackground.zPosition = 4
        
        black = SKSpriteNode(imageNamed: "black")
        black.position = CGPoint(x: 0, y: 0)
        black.size = CGSize(width: 1920, height: 1080)
        black.zPosition = 2
        
        backButton = SKSpriteNode(imageNamed: "backButton")
        backButton.name = "backButton"
        backButton.size = CGSize(width: 255, height: 70)
        backButton.position = CGPoint(x: 0, y: -285)
        backButton.zPosition = 3
        
        settingsLabel = SKLabelNode(text: "SETTINGS")
        settingsLabel.fontName = "GillSans-SemiBold"
        settingsLabel.fontSize = 144
        settingsLabel.position = CGPoint(x: 0, y: 260)
        settingsLabel.zPosition = 3
        
        goalBuzzerButton = SKSpriteNode(imageNamed: "goalBuzzerButton")
        goalBuzzerButton.name = "goalBuzzerButton"
        goalBuzzerButton.position = CGPoint(x: -40, y: 120)
        goalBuzzerButton.zPosition = 3
        if UserDefaults.standard.bool(forKey: "goalBuzzerOff") == false {
            goalBuzzerButton.texture = SKTexture(imageNamed: "onButton")
            goalBuzzerButton.size = CGSize(width: 90, height: 55)
        } else {
            goalBuzzerButton.texture = SKTexture(imageNamed: "offButton")
            goalBuzzerButton.size = CGSize(width: 89.5, height: 54)
        }
        
        goalBuzzerLabel = SKLabelNode(text: "Goal Buzzer")
        goalBuzzerLabel.fontName = "GillSans-SemiBold"
        goalBuzzerLabel.fontSize = 50
        goalBuzzerLabel.position = CGPoint(x: -305, y: 120)
        goalBuzzerLabel.zPosition = 3
        
        buzzerButton = SKSpriteNode(imageNamed: "buzzerButton")
        buzzerButton.name = "buzzerButton"
        buzzerButton.position = CGPoint(x: -40, y: 40)
        buzzerButton.zPosition = 3
        if UserDefaults.standard.bool(forKey: "buzzerOff") == false {
            buzzerButton.texture = SKTexture(imageNamed: "onButton")
            buzzerButton.size = CGSize(width: 90, height: 55)
        } else {
            buzzerButton.texture = SKTexture(imageNamed: "offButton")
            buzzerButton.size = CGSize(width: 89.5, height: 54)
        }
        
        buzzerLabel = SKLabelNode(text: "Buzzer")
        buzzerLabel.fontName = "GillSans-SemiBold"
        buzzerLabel.fontSize = 50
        buzzerLabel.position = CGPoint(x: -365, y: 40)
        buzzerLabel.zPosition = 3
        
        periodChangeButton = SKSpriteNode(imageNamed: "periodChangeButton")
        periodChangeButton.name = "periodChangeButton"
        periodChangeButton.position = CGPoint(x: -40, y: -40)
        periodChangeButton.zPosition = 3
        if UserDefaults.standard.bool(forKey: "periodChangeOff") == false {
            periodChangeButton.texture = SKTexture(imageNamed: "onButton")
            periodChangeButton.size = CGSize(width: 90, height: 55)
        } else {
            periodChangeButton.texture = SKTexture(imageNamed: "offButton")
            periodChangeButton.size = CGSize(width: 89.5, height: 54)
        }
        
        periodChangeLabel = SKLabelNode(text: "Period Change")
        periodChangeLabel.fontName = "GillSans-SemiBold"
        periodChangeLabel.fontSize = 50
        periodChangeLabel.position = CGPoint(x: -280, y: -40)
        periodChangeLabel.zPosition = 3
        
        homePenaltyOnePlusButton = self.childNode(withName: "homePenaltyOnePlusButton") as? SKSpriteNode
        homePenaltyOneMinusButton = self.childNode(withName: "homePenaltyOneMinusButton") as? SKSpriteNode
        homePenaltyTwoPlusButton = self.childNode(withName: "homePenaltyTwoPlusButton") as? SKSpriteNode
        homePenaltyTwoMinusButton = self.childNode(withName: "homePenaltyTwoMinusButton") as? SKSpriteNode
        
        homePlayerOnePlusButton = self.childNode(withName: "homePlayerOnePlusButton") as? SKSpriteNode
        homePlayerOneMinusButton = self.childNode(withName: "homePlayerOneMinusButton") as? SKSpriteNode
        homePlayerTwoPlusButton = self.childNode(withName: "homePlayerTwoPlusButton") as? SKSpriteNode
        homePlayerTwoMinusButton = self.childNode(withName: "homePlayerTwoMinusButton") as? SKSpriteNode
        
        guestPenaltyOnePlusButton = self.childNode(withName: "guestPenaltyOnePlusButton") as? SKSpriteNode
        guestPenaltyOneMinusButton = self.childNode(withName: "guestPenaltyOneMinusButton") as? SKSpriteNode
        guestPenaltyTwoPlusButton = self.childNode(withName: "guestPenaltyTwoPlusButton") as? SKSpriteNode
        guestPenaltyTwoMinusButton = self.childNode(withName: "guestPenaltyTwoMinusButton") as? SKSpriteNode
        
        guestPlayerOnePlusButton = self.childNode(withName: "guestPlayerOnePlusButton") as? SKSpriteNode
        guestPlayerOneMinusButton = self.childNode(withName: "guestPlayerOneMinusButton") as? SKSpriteNode
        guestPlayerTwoPlusButton = self.childNode(withName: "guestPlayerTwoPlusButton") as? SKSpriteNode
        guestPlayerTwoMinusButton = self.childNode(withName: "guestPlayerTwoMinusButton") as? SKSpriteNode
        
    }
    
    
    func runTimerHP1() {
        timerHP1 = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(HockeyScene.updateTimerHP1)), userInfo: nil, repeats: true)
    }
    
    func runTimerHP2() {
        timerHP2 = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(HockeyScene.updateTimerHP2)), userInfo: nil, repeats: true)
    }
    
    func runTimerGP1() {
        timerGP1 = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(HockeyScene.updateTimerGP1)), userInfo: nil, repeats: true)
    }
    
    func runTimerGP2() {
        timerGP2 = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(HockeyScene.updateTimerGP2)), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateTimerHP1() {
        timeHP1 -= 1
        homePenaltyOne.text = timeStringHP1(time: TimeInterval(timeHP1))
        if timeHP1 == 0 {
            timerHP1.invalidate()
            timeHP1 = 120
            homePenaltyOne.text = timeStringHP1(time: TimeInterval(timeHP1))
            if UserDefaults.standard.bool(forKey: "buzzerOff") == true {
            } else {
                self.run(SKAction.playSoundFileNamed("buzzer.mp3", waitForCompletion: false))
            }
            homePenaltyPlayerOneAmount = 0
            homePenaltyPlayerOne.text = "\(homePenaltyPlayerOneAmount)"
        }
    }
    
    @objc func updateTimerHP2() {
        timeHP2 -= 1
        homePenaltyTwo.text = timeStringHP2(time: TimeInterval(timeHP2))
        if timeHP2 == 0 {
            timerHP2.invalidate()
            timeHP2 = 120
            homePenaltyTwo.text = timeStringHP2(time: TimeInterval(timeHP2))
            if UserDefaults.standard.bool(forKey: "buzzerOff") == true {
            } else {
                self.run(SKAction.playSoundFileNamed("buzzer.mp3", waitForCompletion: false))
            }
            homePenaltyPlayerTwoAmount = 0
            homePenaltyPlayerTwo.text = "\(homePenaltyPlayerTwoAmount)"
        }
    }
    
    @objc func updateTimerGP1() {
        timeGP1 -= 1
        guestPenaltyOne.text = timeStringGP1(time: TimeInterval(timeGP1))
        if timeGP1 == 0 {
            timerGP1.invalidate()
            timeGP1 = 120
            guestPenaltyOne.text = timeStringGP1(time: TimeInterval(timeGP1))
            if UserDefaults.standard.bool(forKey: "buzzerOff") == true {
            } else {
                self.run(SKAction.playSoundFileNamed("buzzer.mp3", waitForCompletion: false))
            }
            guestPenaltyPlayerOneAmount = 0
            guestPenaltyPlayerOne.text = "\(guestPenaltyPlayerOneAmount)"
        }
    }
    
    @objc func updateTimerGP2() {
        timeGP2 -= 1
        guestPenaltyTwo.text = timeStringGP2(time: TimeInterval(timeGP2))
        if timeGP2 == 0 {
            timerGP2.invalidate()
            timeGP2 = 120
            guestPenaltyTwo.text = timeStringGP2(time: TimeInterval(timeGP2))
            if UserDefaults.standard.bool(forKey: "buzzerOff") == true {
            } else {
                self.run(SKAction.playSoundFileNamed("buzzer.mp3", waitForCompletion: false))
            }
            guestPenaltyPlayerTwoAmount = 0
            guestPenaltyPlayerTwo.text = "\(guestPenaltyPlayerTwoAmount)"
        }
    }
    
    func timeStringHP1(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    func timeStringHP2(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    func timeStringGP1(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    func timeStringGP2(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    func runTimer() {
        if time == 0 {
        } else {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(HockeyScene.updateTimer)), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateTimer() {
        time -= 1
        timeText.text = timeString(time: TimeInterval(time))
        if time == 0 {
            timer.invalidate()
            time = 0
            timeText.text = timeString(time: TimeInterval(time))
            if UserDefaults.standard.bool(forKey: "buzzerOff") == true {
            } else {
                self.run(SKAction.playSoundFileNamed("buzzer.mp3", waitForCompletion: false))
            }
            timerHP1.invalidate()
            timerHP2.invalidate()
            timerGP1.invalidate()
            timerGP2.invalidate()
            
            if UserDefaults.standard.bool(forKey: "periodChangeOff") == true {
            } else {
                if periodOTAmount == 9 {
                } else if periodOTAmount >= 9 {
                } else {
                    periodAmount += 1
                    periodNumber.text = "\(periodAmount)"
                }
                if periodAmount == 4 {
                    periodNumber.text = "OT1"
                    periodNumber.fontSize = 50
                } else if periodAmount >= 4 {
                    if periodOTAmount == 9 {
                    } else if periodOTAmount >= 9 {
                    } else {
                        periodOTAmount = periodAmount - 3
                        periodNumber.text = "OT\(periodOTAmount)"
                        periodNumber.fontSize = 50
                    }
                }
            }
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "homePenaltyOne" {
                
                if isHomePenaltyOneRunning == false && timeHP1 < 0 {
                    runTimerHP1()
                    isHomePenaltyOneRunning = true
                }else if isHomePenaltyOneRunning == true{
                    timerHP1.invalidate()
                    isHomePenaltyOneRunning = false
                }
                
            } else if nodesArray.first?.name == "homePenaltyTwo" {
                
                if isHomePenaltyTwoRunning == false && timeHP2 < 0 {
                    runTimerHP2()
                    isHomePenaltyTwoRunning = true
                }else if isHomePenaltyTwoRunning == true{
                    timerHP2.invalidate()
                    isHomePenaltyTwoRunning = false
                }
                
            } else if nodesArray.first?.name == "guestPenaltyOne" {
                
                if isGuestPenaltyOneRunning == false && timeGP1 < 0 {
                    runTimerGP1()
                    isGuestPenaltyOneRunning = true
                } else if isGuestPenaltyOneRunning == true{
                    timerGP1.invalidate()
                    isGuestPenaltyOneRunning = false
                }
                
            } else if nodesArray.first?.name == "guestPenaltyTwo" {
                
                if isGuestPenaltyTwoRunning == false && timeGP2 < 0 {
                    runTimerGP2()
                    isGuestPenaltyTwoRunning = true
                } else if isGuestPenaltyTwoRunning == true{
                    timerGP2.invalidate()
                    isGuestPenaltyTwoRunning = false
                    
                }
            } else if nodesArray.first?.name == "periodNumber" {
                if periodOTAmount == 9 {
                } else if periodOTAmount >= 9 {
                } else {
                    periodAmount += 1
                    periodNumber.text = "\(periodAmount)"
                    periodNumber.fontSize = 90
                }
                if periodAmount == 4 {
                    periodNumber.text = "OT1"
                    periodNumber.fontSize = 50
                }  else if periodAmount >= 4 {
                    if periodOTAmount == 9 {
                    } else if periodOTAmount >= 9 {
                    } else {
                        periodOTAmount = periodAmount - 3
                        periodNumber.text = "OT\(periodOTAmount)"
                        periodNumber.fontSize = 50
                    }
                }
                
            } else if nodesArray.first?.name == "menuButton" {
                
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let menuScene = SKScene(fileNamed: "MenuScene") as! MenuScene
                menuScene.scaleMode = .aspectFill
                self.view?.presentScene(menuScene, transition: transition)
                
            } else if nodesArray.first?.name == "timeText" {
                
                if isTimerRunning == false {
                    runTimer()
                    isTimerRunning = true
                    
                    if timeHP1 < 120 && isHomePenaltyOneRunning == false {
                        runTimerHP1()
                        isHomePenaltyOneRunning = true
                    }
                    if timeHP2 < 120 && isHomePenaltyTwoRunning == false{
                        runTimerHP2()
                        isHomePenaltyTwoRunning = true
                    }
                    if timeGP1 < 120 && isGuestPenaltyOneRunning == false {
                        runTimerGP1()
                        isGuestPenaltyOneRunning = true
                    }
                    if timeGP2 < 120 && isGuestPenaltyTwoRunning == false {
                        runTimerGP2()
                        isGuestPenaltyTwoRunning = true
                    }
                } else if isTimerRunning == true {
                        timer.invalidate()
                        isTimerRunning = false
                        isHomePenaltyOneRunning = false
                        isHomePenaltyTwoRunning = false
                        isGuestPenaltyOneRunning = false
                        isGuestPenaltyTwoRunning = false
                        timerHP1.invalidate()
                        isHomePenaltyOneRunning = false
                        timerHP2.invalidate()
                        isHomePenaltyTwoRunning = false
                        timerGP1.invalidate()
                        isGuestPenaltyOneRunning = false
                        timerGP2.invalidate()
                        isGuestPenaltyTwoRunning = false
                }
                
            } else if nodesArray.first?.name == "homeScore" {
                homeScoreAmount += 1
                homeScore.text = "\(homeScoreAmount)"
                shotsHomeAmount += 1
                shotsHomeNumber.text = "\(shotsHomeAmount)"
                if UserDefaults.standard.bool(forKey: "goalBuzzerOff") == true {
                } else {
                    self.run(SKAction.playSoundFileNamed("goalhorn.mp3", waitForCompletion: false))
                }
                
            } else if nodesArray.first?.name == "guestScore" {
                guestScoreAmount += 1
                guestScore.text = "\(guestScoreAmount)"
                shotsGuestAmount += 1
                shotsGuestNumber.text = "\(shotsGuestAmount)"
                if UserDefaults.standard.bool(forKey: "goalBuzzerOff") == true {
                } else {
                    self.run(SKAction.playSoundFileNamed("goalhorn.mp3", waitForCompletion: false))
                }
                
            } else if nodesArray.first?.name == "homePenaltyPlayerOne" {
                homePenaltyPlayerOneAmount += 1
                homePenaltyPlayerOne.text = "\(homePenaltyPlayerOneAmount)"
                
            } else if nodesArray.first?.name == "homePenaltyPlayerTwo" {
                homePenaltyPlayerTwoAmount += 1
                homePenaltyPlayerTwo.text = "\(homePenaltyPlayerTwoAmount)"
                
            } else if nodesArray.first?.name == "guestPenaltyPlayerOne" {
                guestPenaltyPlayerOneAmount += 1
                guestPenaltyPlayerOne.text = "\(guestPenaltyPlayerOneAmount)"
                
            } else if nodesArray.first?.name == "guestPenaltyPlayerTwo" {
                guestPenaltyPlayerTwoAmount += 1
                guestPenaltyPlayerTwo.text = "\(guestPenaltyPlayerTwoAmount)"
                
            } else if nodesArray.first?.name == "shotsHomeNumber" {
                shotsHomeAmount += 1
                shotsHomeNumber.text = "\(shotsHomeAmount)"
                
            } else if nodesArray.first?.name == "shotsGuestNumber" {
                shotsGuestAmount += 1
                shotsGuestNumber.text = "\(shotsGuestAmount)"
             } else if nodesArray.first?.name == "buzzer" {
                
                self.run(SKAction.playSoundFileNamed("buzzer.mp3", waitForCompletion: false))
                
            } else if nodesArray.first?.name == "timeSelection" {
                
                if timeSelection.text == "TIME" {
                
                if isTimerRunning == true {
                    timer.invalidate()
                    isTimerRunning = false
                }
                
                //assign delegate and datasoursce to its view controller
                timePicker.delegate = self
                timePicker.dataSource = self
                
                // setting properties of the pickerView
                timePicker.frame = CGRect(x: self.size.width/2 - 160, y: 398.125, width: 400, height: 400)
                timePicker.backgroundColor = .white
                
                // add pickerView to the view
                self.view?.addSubview(timePicker)
                self.addChild(timePickerBackground)
                
                timeSelection.text = "DONE"
                    
                } else if timeSelection.text == "DONE" {
                    
                    timePicker.removeFromSuperview()
                    timePickerBackground.removeFromParent()
                    timeSelection.text = "TIME"
                    
                }
                    
            } else if nodesArray.first?.name == "timePlusButton" {
                
                time += 60
                timeText.text = timeString(time: TimeInterval(time))
                if #available(iOS 10.0, *) {
                    timePlusButton.scale(to: CGSize(width: 30, height: 30))
                } else {
                    timePlusButton.size = CGSize(width: 30, height: 30)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.timePlusButton.size = CGSize(width: 40, height: 40)
                })
                
            } else if nodesArray.first?.name == "timeMinusButton" {
                
                if time == 0 {
                } else {
                    if time <= 59 {
                    } else {
                        time -= 60
                        timeText.text = timeString(time: TimeInterval(time))
                    }
                }
                if #available(iOS 10.0, *) {
                    timeMinusButton.scale(to: CGSize(width: 30, height: 30))
                } else {
                    timeMinusButton.size = CGSize(width: 30, height: 30)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.timeMinusButton.size = CGSize(width: 40, height: 40)
                })
                
            } else if nodesArray.first?.name == "homeScorePlusButton" {
                
                homeScoreAmount += 1
                shotsHomeAmount += 1
                homeScore.text = "\(homeScoreAmount)"
                shotsHomeNumber.text = "\(shotsHomeAmount)"
                if #available(iOS 10.0, *) {
                    homeScorePlusButton.scale(to: CGSize(width: 30, height: 30))
                } else {
                    homeScorePlusButton.size = CGSize(width: 30, height: 30)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.homeScorePlusButton.size = CGSize(width: 40, height: 40)
                })
                
            } else if nodesArray.first?.name == "homeScoreMinusButton" {
                
                if homeScoreAmount == 0 {
                } else {
                    homeScoreAmount -= 1
                    homeScore.text = "\(homeScoreAmount)"
                }
                if #available(iOS 10.0, *) {
                    homeScoreMinusButton.scale(to: CGSize(width: 30, height: 30))
                } else {
                    homeScoreMinusButton.size = CGSize(width: 30, height: 30)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.homeScoreMinusButton.size = CGSize(width: 40, height: 40)
                })
                
            } else if nodesArray.first?.name == "guestScorePlusButton" {
                
                guestScoreAmount += 1
                shotsGuestAmount += 1
                guestScore.text = "\(guestScoreAmount)"
                shotsGuestNumber.text = "\(shotsGuestAmount)"
                if #available(iOS 10.0, *) {
                    guestScorePlusButton.scale(to: CGSize(width: 30, height: 30))
                } else {
                    guestScorePlusButton.size = CGSize(width: 30, height: 30)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.guestScorePlusButton.size = CGSize(width: 40, height: 40)
                })
                
            } else if nodesArray.first?.name == "guestScoreMinusButton" {
                
                if guestScoreAmount == 0 {
                } else {
                    guestScoreAmount -= 1
                    guestScore.text = "\(guestScoreAmount)"
                }
                if #available(iOS 10.0, *) {
                    guestScoreMinusButton.scale(to: CGSize(width: 30, height: 30))
                } else {
                    guestScoreMinusButton.size = CGSize(width: 30, height: 30)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.guestScoreMinusButton.size = CGSize(width: 40, height: 40)
                })
                
            } else if nodesArray.first?.name == "homeShotsPlusButton" {
                
                shotsHomeAmount += 1
                shotsHomeNumber.text = "\(shotsHomeAmount)"
                if #available(iOS 10.0, *) {
                    homeShotsPlusButton.scale(to: CGSize(width: 30, height: 30))
                } else {
                    homeShotsPlusButton.size = CGSize(width: 30, height: 30)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.homeShotsPlusButton.size = CGSize(width: 40, height: 40)
                })
                
            } else if nodesArray.first?.name == "homeShotsMinusButton" {
                
                if shotsHomeAmount == 0 {
                } else {
                    shotsHomeAmount -= 1
                    shotsHomeNumber.text = "\(shotsHomeAmount)"
                }
                if #available(iOS 10.0, *) {
                    homeShotsMinusButton.scale(to: CGSize(width: 30, height: 30))
                } else {
                    homeShotsMinusButton.size = CGSize(width: 30, height: 30)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.homeShotsMinusButton.size = CGSize(width: 40, height: 40)
                })
                
            } else if nodesArray.first?.name == "guestShotsPlusButton" {
                
                shotsGuestAmount += 1
                shotsGuestNumber.text = "\(shotsGuestAmount)"
                if #available(iOS 10.0, *) {
                    guestShotsPlusButton.scale(to: CGSize(width: 30, height: 30))
                } else {
                    guestShotsPlusButton.size = CGSize(width: 30, height: 30)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.guestShotsPlusButton.size = CGSize(width: 40, height: 40)
                })
                
            } else if nodesArray.first?.name == "guestShotsMinusButton" {
                
                if shotsGuestAmount == 0 {
                } else {
                shotsGuestAmount -= 1
                shotsGuestNumber.text = "\(shotsGuestAmount)"
                }
                if #available(iOS 10.0, *) {
                    guestShotsMinusButton.scale(to: CGSize(width: 30, height: 30))
                } else {
                    guestShotsMinusButton.size = CGSize(width: 30, height: 30)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.guestShotsMinusButton.size = CGSize(width: 40, height: 40)
                })
                
            } else if nodesArray.first?.name == "periodPlusButton" {
                
                if periodOTAmount == 9 {
                } else if periodOTAmount >= 9 {
                } else {
                    periodAmount += 1
                    periodNumber.text = "\(periodAmount)"
                    periodNumber.fontSize = 90
                }
                if periodAmount == 4 {
                    periodNumber.text = "OT1"
                    periodNumber.fontSize = 50
                } else if periodAmount >= 4 {
                    if periodOTAmount == 9 {
                    } else if periodOTAmount >= 9 {
                    } else {
                        periodOTAmount = periodAmount - 3
                        periodNumber.text = "OT\(periodOTAmount)"
                        periodNumber.fontSize = 50
                    }
            }
                if #available(iOS 10.0, *) {
                    periodPlusButton.scale(to: CGSize(width: 30, height: 30))
                } else {
                    periodPlusButton.size = CGSize(width: 30, height: 30)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.periodPlusButton.size = CGSize(width: 40, height: 40)
                })
                
            } else if nodesArray.first?.name == "periodMinusButton" {
                
                if periodAmount == 0 {
                } else {
                    periodAmount -= 1
                    if periodAmount == 4 {
                        periodNumber.text = "OT1"
                        periodNumber.fontSize = 50
                    } else if periodAmount >= 4 {
                        periodOTAmount = periodAmount - 3
                        periodNumber.text = "OT\(periodOTAmount)"
                        periodNumber.fontSize = 50
                    } else if periodAmount <= 4 {
                        periodNumber.text = "\(periodAmount)"
                        periodNumber.fontSize = 96
                    }
                }
                if #available(iOS 10.0, *) {
                    periodMinusButton.scale(to: CGSize(width: 30, height: 30))
                } else {
                    periodMinusButton.size = CGSize(width: 30, height: 30)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.periodMinusButton.size = CGSize(width: 40, height: 40)
                })
                
            } else if nodesArray.first?.name == "settingsButton" {
                
                self.addChild(black)
                self.addChild(backButton)
                self.addChild(settingsLabel)
                self.addChild(goalBuzzerButton)
                self.addChild(buzzerButton)
                self.addChild(periodChangeButton)
                self.addChild(goalBuzzerLabel)
                self.addChild(buzzerLabel)
                self.addChild(periodChangeLabel)
                
            } else if nodesArray.first?.name == "goalBuzzerButton" {
                if UserDefaults.standard.bool(forKey: "goalBuzzerOff") == false {
                    UserDefaults.standard.set(true, forKey: "goalBuzzerOff")
                    goalBuzzerButton.texture = SKTexture(imageNamed: "offButton")
                    goalBuzzerButton.size = CGSize(width: 89.5, height: 54)
                } else {
                    UserDefaults.standard.set(false, forKey: "goalBuzzerOff")
                    goalBuzzerButton.texture = SKTexture(imageNamed: "onButton")
                    goalBuzzerButton.size = CGSize(width: 90, height: 55)
                }
            } else if nodesArray.first?.name == "buzzerButton" {
                if UserDefaults.standard.bool(forKey: "buzzerOff") == false {
                    UserDefaults.standard.set(true, forKey: "buzzerOff")
                    buzzerButton.texture = SKTexture(imageNamed: "offButton")
                    buzzerButton.size = CGSize(width: 89.5, height: 54)
                } else {
                    UserDefaults.standard.set(false, forKey: "buzzerOff")
                    buzzerButton.texture = SKTexture(imageNamed: "onButton")
                    buzzerButton.size = CGSize(width: 90, height: 55)
                }
            } else if nodesArray.first?.name == "periodChangeButton" {
                if UserDefaults.standard.bool(forKey: "periodChangeOff") == false {
                    UserDefaults.standard.set(true, forKey: "periodChangeOff")
                    periodChangeButton.texture = SKTexture(imageNamed: "offButton")
                    periodChangeButton.size = CGSize(width: 89.5, height: 54)
                } else {
                    UserDefaults.standard.set(false, forKey: "periodChangeOff")
                    periodChangeButton.texture = SKTexture(imageNamed: "onButton")
                    periodChangeButton.size = CGSize(width: 90, height: 55)
                }
            } else if nodesArray.first?.name == "backButton" {
                
                goalBuzzerButton.removeFromParent()
                buzzerButton.removeFromParent()
                periodChangeButton.removeFromParent()
                goalBuzzerLabel.removeFromParent()
                buzzerLabel.removeFromParent()
                periodChangeLabel.removeFromParent()
                backButton.removeFromParent()
                black.removeFromParent()
                settingsLabel.removeFromParent()
                
            } else if nodesArray.first?.name == "homePlayerOnePlusButton" {
                
                homePenaltyPlayerOneAmount += 1
                homePenaltyPlayerOne.text = "\(homePenaltyPlayerOneAmount)"
                if #available(iOS 10.0, *) {
                    homePlayerOnePlusButton.scale(to: CGSize(width: 20, height: 20))
                } else {
                    homePlayerOnePlusButton.size = CGSize(width: 20, height: 20)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.homePenaltyOnePlusButton.size = CGSize(width: 30, height: 30)
                })
                
            } else if nodesArray.first?.name == "homePlayerOneMinusButton" {
                
                if homePenaltyPlayerOneAmount == 0 {
                } else {
                    homePenaltyPlayerOneAmount -= 1
                    homePenaltyPlayerOne.text = "\(homePenaltyPlayerOneAmount)"
                }
                if #available(iOS 10.0, *) {
                    homePlayerOneMinusButton.scale(to: CGSize(width: 20, height: 20))
                } else {
                    homePlayerOneMinusButton.size = CGSize(width: 20, height: 20)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.homePlayerOneMinusButton.size = CGSize(width: 30, height: 30)
                })
                
            } else if nodesArray.first?.name == "homePlayerTwoPlusButton" {
                
                homePenaltyPlayerTwoAmount += 1
                homePenaltyPlayerTwo.text = "\(homePenaltyPlayerTwoAmount)"
                if #available(iOS 10.0, *) {
                    homePlayerTwoPlusButton.scale(to: CGSize(width: 20, height: 20))
                } else {
                    homePlayerTwoPlusButton.size = CGSize(width: 20, height: 20)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.homePlayerTwoPlusButton.size = CGSize(width: 30, height: 30)
                })
                
            } else if nodesArray.first?.name == "homePlayerTwoMinusButton" {
                
                if homePenaltyPlayerTwoAmount == 0 {
                } else {
                    homePenaltyPlayerTwoAmount -= 1
                    homePenaltyPlayerTwo.text = "\(homePenaltyPlayerTwoAmount)"
                }
                if #available(iOS 10.0, *) {
                    homePlayerTwoMinusButton.scale(to: CGSize(width: 20, height: 20))
                } else {
                    homePlayerTwoMinusButton.size = CGSize(width: 20, height: 20)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.homePlayerTwoMinusButton.size = CGSize(width: 30, height: 30)
                })
                
            } else if nodesArray.first?.name == "homePenaltyOnePlusButton" {
                
                timeHP1 += 30
                homePenaltyOne.text = timeString(time: TimeInterval(timeHP1))
                if #available(iOS 10.0, *) {
                    homePenaltyOnePlusButton.scale(to: CGSize(width: 20, height: 20))
                } else {
                    homePenaltyOnePlusButton.size = CGSize(width: 20, height: 20)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.homePenaltyOnePlusButton.size = CGSize(width: 30, height: 30)
                })
                
            } else if nodesArray.first?.name == "homePenaltyOneMinusButton" {
                
                if timeHP1 <= 29 {
                } else {
                    timeHP1 -= 30
                    homePenaltyOne.text = timeString(time: TimeInterval(timeHP1))
                }
                if #available(iOS 10.0, *) {
                    homePenaltyOneMinusButton.scale(to: CGSize(width: 20, height: 20))
                } else {
                    homePenaltyOneMinusButton.size = CGSize(width: 20, height: 20)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.homePenaltyOneMinusButton.size = CGSize(width: 30, height: 30)
                })
                
            } else if nodesArray.first?.name == "homePenaltyTwoPlusButton" {
                
                timeHP2 += 30
                homePenaltyTwo.text = timeString(time: TimeInterval(timeHP2))
                if #available(iOS 10.0, *) {
                    homePenaltyTwoPlusButton.scale(to: CGSize(width: 20, height: 20))
                } else {
                    homePenaltyTwoPlusButton.size = CGSize(width: 20, height: 20)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.homePenaltyTwoPlusButton.size = CGSize(width: 30, height: 30)
                })
                
            } else if nodesArray.first?.name == "homePenaltyTwoMinusButton" {
                
                if timeHP2 <= 29 {
                } else {
                    timeHP2 -= 30
                    homePenaltyTwo.text = timeString(time: TimeInterval(timeHP2))
                }
                if #available(iOS 10.0, *) {
                    homePenaltyTwoMinusButton.scale(to: CGSize(width: 20, height: 20))
                } else {
                    homePenaltyTwoMinusButton.size = CGSize(width: 20, height: 20)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.homePenaltyTwoMinusButton.size = CGSize(width: 30, height: 30)
                })
                
            } else if nodesArray.first?.name == "guestPlayerOnePlusButton" {
                
                guestPenaltyPlayerOneAmount += 1
                guestPenaltyPlayerOne.text = "\(guestPenaltyPlayerOneAmount)"
                if #available(iOS 10.0, *) {
                    guestPlayerOnePlusButton.scale(to: CGSize(width: 20, height: 20))
                } else {
                    guestPlayerOnePlusButton.size = CGSize(width: 20, height: 20)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.guestPlayerOnePlusButton.size = CGSize(width: 30, height: 30)
                })
                
            } else if nodesArray.first?.name == "guestPlayerOneMinusButton" {
                
                if guestPenaltyPlayerOneAmount == 0 {
                } else {
                    guestPenaltyPlayerOneAmount -= 1
                    guestPenaltyPlayerOne.text = "\(guestPenaltyPlayerOneAmount)"
                }
                if #available(iOS 10.0, *) {
                    guestPlayerOneMinusButton.scale(to: CGSize(width: 20, height: 20))
                } else {
                    guestPlayerOneMinusButton.size = CGSize(width: 20, height: 20)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.guestPlayerOneMinusButton.size = CGSize(width: 30, height: 30)
                })
                
            } else if nodesArray.first?.name == "guestPlayerTwoPlusButton" {
                
                guestPenaltyPlayerTwoAmount += 1
                guestPenaltyPlayerTwo.text = "\(guestPenaltyPlayerTwoAmount)"
                if #available(iOS 10.0, *) {
                    guestPlayerTwoPlusButton.scale(to: CGSize(width: 20, height: 20))
                } else {
                    guestPlayerTwoPlusButton.size = CGSize(width: 20, height: 20)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.guestPlayerTwoPlusButton.size = CGSize(width: 30, height: 30)
                })
                
            } else if nodesArray.first?.name == "guestPlayerTwoMinusButton" {
                
                if guestPenaltyPlayerTwoAmount == 0 {
                } else {
                    guestPenaltyPlayerTwoAmount -= 1
                    guestPenaltyPlayerTwo.text = "\(guestPenaltyPlayerTwoAmount)"
                }
                if #available(iOS 10.0, *) {
                    guestPlayerTwoMinusButton.scale(to: CGSize(width: 20, height: 20))
                } else {
                    guestPlayerTwoMinusButton.size = CGSize(width: 20, height: 20)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.guestPlayerTwoMinusButton.size = CGSize(width: 30, height: 30)
                })
                
            } else if nodesArray.first?.name == "guestPenaltyOnePlusButton" {
                
                timeGP1 += 30
                guestPenaltyOne.text = timeString(time: TimeInterval(timeGP1))
                if #available(iOS 10.0, *) {
                    guestPenaltyOnePlusButton.scale(to: CGSize(width: 20, height: 20))
                } else {
                    guestPenaltyOnePlusButton.size = CGSize(width: 20, height: 20)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.guestPenaltyOnePlusButton.size = CGSize(width: 30, height: 30)
                })
                
            } else if nodesArray.first?.name == "guestPenaltyOneMinusButton" {
                
                if timeGP1 <= 29 {
                } else {
                    timeGP1 -= 30
                    guestPenaltyOne.text = timeString(time: TimeInterval(timeGP1))
                }
                if #available(iOS 10.0, *) {
                    guestPenaltyOneMinusButton.scale(to: CGSize(width: 20, height: 20))
                } else {
                    guestPenaltyOneMinusButton.size = CGSize(width: 20, height: 20)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.guestPenaltyOneMinusButton.size = CGSize(width: 30, height: 30)
                })
                
            } else if nodesArray.first?.name == "guestPenaltyTwoPlusButton" {
                
                timeGP2 += 30
                guestPenaltyTwo.text = timeString(time: TimeInterval(timeGP2))
                if #available(iOS 10.0, *) {
                    guestPenaltyTwoPlusButton.scale(to: CGSize(width: 20, height: 20))
                } else {
                    guestPenaltyTwoPlusButton.size = CGSize(width: 20, height: 20)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.guestPenaltyTwoPlusButton.size = CGSize(width: 30, height: 30)
                })
                
            } else if nodesArray.first?.name == "guestPenaltyTwoMinusButton" {
                
                if timeGP2 <= 29 {
                } else {
                    timeGP2 -= 30
                    guestPenaltyTwo.text = timeString(time: TimeInterval(timeGP2))
                }
                if #available(iOS 10.0, *) {
                    guestPenaltyTwoMinusButton.scale(to: CGSize(width: 20, height: 20))
                } else {
                    guestPenaltyTwoMinusButton.size = CGSize(width: 20, height: 20)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    self.guestPenaltyTwoMinusButton.size = CGSize(width: 30, height: 30)
                })
                
            }
                }
            }
        }

func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }

extension HockeyScene: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%02d", row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            let minute = row
            print("Minute: \(minute)")
            timerMinutes = minute * 60
            time = timerMinutes + timerSeconds
            timeText.text = timeString(time: TimeInterval(time))
        } else {
            let second = row
            print("Second: \(second)")
            timerSeconds = second
            time = timerMinutes + timerSeconds
            timeText.text = timeString(time: TimeInterval(time))

    }
}
}
