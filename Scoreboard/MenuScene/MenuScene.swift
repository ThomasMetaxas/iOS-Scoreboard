//
//  MenuScene.swift
//  Scoreboard
//
//  Created by Thomas Metaxas on 2018-12-16.
//  Copyright © 2018 Thomas Metaxas. All rights reserved.
//

import UIKit
import SpriteKit

class MenuScene: SKScene {

    var menuBackground:SKSpriteNode!
    
    var hockeyButton:SKSpriteNode!
    var timeButton:SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        menuBackground = SKSpriteNode(imageNamed: "menuBackground")
        
        hockeyButton = SKSpriteNode(imageNamed: "hockeyButton")
        timeButton = SKSpriteNode(imageNamed: "timeButton")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "hockeyButton" {
                
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let hockeyScene = SKScene(fileNamed: "HockeyScene") as! HockeyScene
                hockeyScene.scaleMode = .aspectFill
                self.view?.presentScene(hockeyScene, transition: transition)
                
            } else if nodesArray.first?.name == "timeButton" {
                
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let timeScene = SKScene(fileNamed: "TimeScene") as! TimeScene
                timeScene.scaleMode = .aspectFill
                self.view?.presentScene(timeScene, transition: transition)
                
            }
        }
    }
    
}
