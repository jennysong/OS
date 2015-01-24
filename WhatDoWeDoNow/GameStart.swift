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
        backgroundColor = SKColor.whiteColor()
        
        label1 = mkLabel("What Do We Do Now ?", 30, SKColor.blackColor(), CGPoint(x: size.width * 0.5, y: size.height * 0.8))
        let sb = UIButton()
        sb.setTitle("Start", forState: .Normal)
        sb.setTitleColor(UIColor.blueColor(), forState: .Normal)
        
        label2 = mkLabel("Start", 20, SKColor.blackColor(), CGPoint(x: size.width  * 0.5, y: size.height * 0.5))
        addChild(label1)
        addChild(label2)
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
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


