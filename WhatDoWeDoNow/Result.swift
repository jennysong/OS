//
//  Result.swift
//  WhatDoWeDoNow
//
//  Created by Younsuk Oh on 1/24/15.
//  Copyright (c) 2015 OS. All rights reserved.
//
//
import Foundation
import SpriteKit
import UIKit

class Result: SKScene {
   
    
    init(size: CGSize, string: String) {
        super.init(size: size)
        var background = SKSpriteNode(imageNamed: string + "Background")
        background.size.height = self.size.height
        background.size.width = self.size.width
        background.anchorPoint = CGPoint(x:0, y:0)
        addChild(background)
        runAction(SKAction.playSoundFileNamed("tada.wav", waitForCompletion: false))
        runAction(SKAction.sequence([SKAction.waitForDuration(3.0),SKAction.runBlock(){
            let reveal = SKTransition.flipHorizontalWithDuration(0.2)
            let scene = GameStart(size: self.size)
            self.view?.presentScene(scene, transition:reveal)
            }
        ]))
    }
    
    init(size: CGSize, string: String, score: Int) {
        super.init(size: size)
        var background = SKSpriteNode(imageNamed: string + "Background")
        background.size.height = self.size.height
        background.size.width = self.size.width
        background.anchorPoint = CGPoint(x:0, y:0)
        addChild(background)
        
        var scoreText = SKLabelNode(fontNamed: "AppleSDGothicNeo-Bold")
        scoreText.text = String(score)
        println("scoreText")
        scoreText.fontSize = 20
        scoreText.fontColor = SKColor.whiteColor()
        scoreText.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
        addChild(scoreText)
        
        runAction(SKAction.playSoundFileNamed("tada.wav", waitForCompletion: false))
        runAction(SKAction.sequence([SKAction.waitForDuration(3.0),SKAction.runBlock(){
            let reveal = SKTransition.flipHorizontalWithDuration(0.2)
            let scene = GameStart(size: self.size)
            self.view?.presentScene(scene, transition:reveal)
            }
            ]))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}