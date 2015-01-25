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
import AVFoundation

var backgroundMusicPlayer: AVAudioPlayer!

func playBackgroundMusic(filename: String) {
    let url = NSBundle.mainBundle().URLForResource(
        filename, withExtension: nil)
    if (url == nil) {
        println("Could not find file: \(filename)")
        return
    }
    
    var error: NSError? = nil
    backgroundMusicPlayer =
        AVAudioPlayer(contentsOfURL: url, error: &error)
    if backgroundMusicPlayer == nil {
        println("Could not create audio player: \(error!)")
        return
    }
    
    backgroundMusicPlayer.numberOfLoops = -1
    backgroundMusicPlayer.prepareToPlay()
    backgroundMusicPlayer.play()
}



class GameStart: SKScene {
    //var level: Level!
    //var lv = 1
    var scoreManager = ScoreManager()
    override init(size: CGSize) {
        super.init(size: size)
        var score = scoreManager.max()
        let scoreLabel = SKLabelNode(fontNamed: "ChalkboardSE-Light")
        
        //runAction(SKAction.repeatActionForever(SKAction.playSoundFileNamed("start.mp3", waitForCompletion: true)))
        
        scoreLabel.text = "Highest Score: "+String(score)
        scoreLabel.fontSize = 18
        scoreLabel.fontColor = SKColor.whiteColor()
        scoreLabel.position = CGPoint(x:self.size.width*(0.85), y:self.size.height*0.9)
        
        //playBackgroundMusic("puyo.caf")
        //runAction(SKAction.playSoundFileNamed("start.mp3", waitForCompletion: false))
        let ratio = 1/self.size.height*195
        
        var background = SKSpriteNode(imageNamed: "background")
        background.size.height = self.size.height
        background.size.width = self.size.width
        background.anchorPoint = CGPoint(x:0, y:0)
        
        var backgroundTalkbox = SKSpriteNode(imageNamed: "backgroundTalkbox")
        backgroundTalkbox.size.height *= ratio
        backgroundTalkbox.size.width *= ratio
        backgroundTalkbox.position = CGPoint(x:self.size.width*(0.35), y:self.size.height*0.55)
        
        addChild(background)
        addChild(backgroundTalkbox)
        addChild(scoreLabel)

        
        //3 action buttons
        
        var buttonSingle = SKSpriteNode(imageNamed: "buttonSingle")
        buttonSingle.size.height *= ratio
        buttonSingle.size.width *= ratio
        buttonSingle.position = CGPoint(x:self.size.width*(0.80), y:self.size.height*0.42)
        var buttonSingle_ = SKSpriteNode(imageNamed: "buttonSingle_")
        buttonSingle_.size.height *= ratio
        buttonSingle_.size.width *= ratio
        buttonSingle_.position = CGPoint(x:self.size.width*(0.80), y:self.size.height*0.42)
        
        
        var buttonDual = SKSpriteNode(imageNamed: "buttonDual")
        buttonDual.size.height *= ratio
        buttonDual.size.width *= ratio
        buttonDual.position = CGPoint(x:self.size.width*(0.80), y:self.size.height*0.15)
        var buttonDual_ = SKSpriteNode(imageNamed: "buttonDual_")
        buttonDual_.size.height *= ratio
        buttonDual_.size.width *= ratio
        buttonDual_.position = CGPoint(x:self.size.width*(0.80), y:self.size.height*0.15)

        var buttonHowTo = SKSpriteNode(imageNamed: "buttonHowTo")
        buttonHowTo.size.height *= ratio
        buttonHowTo.size.width *= ratio
        buttonHowTo.position = CGPoint(x:self.size.width*(0.10), y:self.size.height*0.15)
        var buttonHowTo_ = SKSpriteNode(imageNamed: "buttonHowTo_")
        buttonHowTo_.size.height *= ratio
        buttonHowTo_.size.width *= ratio
        buttonHowTo_.position = CGPoint(x:self.size.width*(0.10), y:self.size.height*0.15)
        
        
        
        let a:ActionButton = ActionButton(defaultButtonImage: buttonSingle, activeButtonImage: buttonSingle_, buttonAction: changeScene)
        let b:ActionButton = ActionButton(defaultButtonImage: buttonDual, activeButtonImage: buttonDual_, buttonAction: changeSceneTwo)
        let c:ActionButton = ActionButton(defaultButtonImage: buttonHowTo, activeButtonImage: buttonHowTo_, buttonAction: changeSceneThree)
        addChild(a)
        addChild(b)
        addChild(c)


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func changeScene(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = GameScene(size: self.size)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }

    func changeSceneTwo(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = GameSceneTwo(size: self.size)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    func changeSceneThree(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = GameSceneThree(size: self.size)
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


