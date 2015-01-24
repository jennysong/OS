//
//  GameStart.swift
//  WhatDoWeDoNow
//
//  Created by Younsuk Oh on 1/23/15.
//  Copyright (c) 2015 OS. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class GameStart: SKScene {
    var label1 = SKLabelNode()
    var label2 = SKLabelNode()
    
    override init(size: CGSize) {
        super.init(size: size)
        var background = SKSpriteNode(imageNamed: "background")
        background.size.height = self.size.height
        background.size.width = self.size.width
        background.anchorPoint = CGPoint(x:0, y:0)
        let startButton:ActionButton = ActionButton(defaultButtonImage: "startButton1", activeButtonImage: "startButton_1", buttonAction: donothing)
        startButton.position = CGPoint(x: size.width * 0.8, y: size.height * 0.3)
        let levelButton:ActionButton = ActionButton(defaultButtonImage: "levelButton1", activeButtonImage: "levelButton_1", buttonAction: donothing)
        levelButton.position = CGPoint(x: size.width * 0.8, y: size.height * 0.15)

        addChild(background)
        addChild(startButton)
        addChild(levelButton)
        
        

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func donothing(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = GameScene(size: self.size)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    
}

func mkLabel(s: String, si: CGFloat, cr: SKColor, po: CGPoint) -> SKLabelNode {
    let label = SKLabelNode()
    label.text = s
    label.fontSize = si
    label.fontColor = cr
    label.position = po
    
    return label
}


