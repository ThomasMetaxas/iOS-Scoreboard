//
//  TimeScene.swift
//  Scoreboard
//
//  Created by Thomas Metaxas on 2018-12-16.
//  Copyright © 2018 Thomas Metaxas. All rights reserved.
//

import UIKit
import SpriteKit

class TimeScene: SKScene {

    var timeText:SKLabelNode!
    
    var timer = Timer()
    
    var menuButton:SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        timeText = self.childNode(withName: "timeText") as? SKLabelNode
        
        menuButton = SKSpriteNode(imageNamed: "menuButton")
        
        timeText.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
        
    }
    
    @objc func tick() {
        timeText.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "menuButton" {
                
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let menuScene = SKScene(fileNamed: "MenuScene") as! MenuScene
                menuScene.scaleMode = .aspectFill
                self.view?.presentScene(menuScene, transition: transition)
                
            }
        }
    }
    
}
