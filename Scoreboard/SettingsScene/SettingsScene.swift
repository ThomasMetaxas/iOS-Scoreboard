//
//  SettingsScene.swift
//  Scoreboard
//
//  Created by Thomas Metaxas on 2019-07-31.
//  Copyright © 2019 Thomas Metaxas. All rights reserved.
//

import UIKit
import SpriteKit

class SettingsScene: SKScene {

    var goalBuzzerButton:SKSpriteNode!
    var buzzerButton:SKSpriteNode!
    
    var periodChangeButton:SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        goalBuzzerButton = SKSpriteNode(imageNamed: "goalBuzzerButton")
        goalBuzzerButton.position = CGPoint(x: -40, y: 120)
        if UserDefaults.standard.bool(forKey: "goalBuzzerOff") == false {
            goalBuzzerButton.texture = SKTexture(imageNamed: "onButton")
            goalBuzzerButton.size = CGSize(width: 90, height: 55)
        } else {
            goalBuzzerButton.texture = SKTexture(imageNamed: "offButton")
            goalBuzzerButton.size = CGSize(width: 89.5, height: 54)
        }
        
        buzzerButton = SKSpriteNode(imageNamed: "buzzerButton")
        buzzerButton.position = CGPoint(x: -40, y: 40)
        if UserDefaults.standard.bool(forKey: "buzzerOff") == false {
            buzzerButton.texture = SKTexture(imageNamed: "onButton")
            buzzerButton.size = CGSize(width: 90, height: 55)
        } else {
            buzzerButton.texture = SKTexture(imageNamed: "offButton")
            buzzerButton.size = CGSize(width: 89.5, height: 54)
        }
        
        periodChangeButton = SKSpriteNode(imageNamed: "periodChangeButton")
        periodChangeButton.position = CGPoint(x: -40, y: -40)
        if UserDefaults.standard.bool(forKey: "periodChangeOff") == false {
            periodChangeButton.texture = SKTexture(imageNamed: "onButton")
            periodChangeButton.size = CGSize(width: 90, height: 55)
        } else {
            periodChangeButton.texture = SKTexture(imageNamed: "offButton")
            periodChangeButton.size = CGSize(width: 89.5, height: 54)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "goalBuzzerButton" {
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
                
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let hockeyScene = SKScene(fileNamed: "HockeyScene") as! HockeyScene
                hockeyScene.scaleMode = .aspectFill
                self.view?.presentScene(hockeyScene, transition: transition)
                
            }
        }
    }
    
}
