//
//  NewGameScene.swift
//  testVH
//
//  Created by Student on 3/16/18.
//  Copyright © 2018 Student. All rights reserved.
//

import SpriteKit
import GameplayKit

class NewGameScene: SKScene {
    
    private var sceneNext: SKScene?
    private var BackGameButton: SKLabelNode?
    private var otherGameScene: SKScene?
    
    override func didMove(to view: SKView) {
        let textNodeNew = SKLabelNode(fontNamed: "Chalkduster")
        textNodeNew.text = "New Game Scene!"
        textNodeNew.fontSize = 65
        textNodeNew.fontColor = SKColor.green
        textNodeNew.position = CGPoint(x: frame.midX, y: frame.midY + 200)
        
        addChild(textNodeNew)
        
        let menuNode = SKLabelNode(fontNamed: "Papyrus")
        menuNode.name = "menuNode"
        menuNode.text = "Return to Menu"
        menuNode.fontSize = 80
        menuNode.fontColor = SKColor.black
        menuNode.position = CGPoint(x: frame.midX, y: frame.midY - 150)
        addChild(menuNode)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        print("clicked")
        if let name = touchedNode.name,
            name == "menuNode"{
            print("menuNode clicked")
            sceneNext = SKScene(fileNamed: "GameScene")
        }else{
            return
            
        }

        let transition = SKTransition.reveal(
            with: .down, duration: 1.0)
        
        let nextScene = sceneNext
        nextScene?.scaleMode = .aspectFill
        
        scene?.view?.presentScene(sceneNext!, transition: transition)
        print("transitionToMenu from newGameScene")
        
    }
}
