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
        let background = SKSpriteNode(imageNamed: "background")
//        let sb = UIButton()
//        sb.setTitle("Start", forState: .Normal)
//        sb.setTitleColor(UIColor.blueColor(), forState: .Normal)
        let sb:ActionButton = ActionButton(defaultButtonImage: "startButton", activeButtonImage: "starButton_", buttonAction: donothing)
        sb.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        addChild(background)
        addChild(sb)
        
        
        
        
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


