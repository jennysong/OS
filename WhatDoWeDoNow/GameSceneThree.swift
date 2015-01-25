//
//  GameScene2.swift
//  WhatDoWeDoNow
//
//  Created by Younsuk Oh on 1/24/15.
//  Copyright (c) 2015 OS. All rights reserved.
//

import Foundation
import SpriteKit

class GameSceneThree: SKScene {
    
    override init(size: CGSize) {
        super.init(size: size)
        
        let goBack:ActionButton = ActionButton(defaultButtonImage: "goBackToStart", activeButtonImage: "goBackToStart_", buttonAction: goBackToStart)
        goBack.position = CGPoint(x: size.width * 0.35, y: size.height * 0.48)
        addChild(goBack)

        anchorPoint = CGPoint(x: 0.5, y:0.45)
        backgroundColor = SKColor.blackColor()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func goBackToStart(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = GameStart(size: self.size)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    
}





