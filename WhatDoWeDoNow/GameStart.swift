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
    var level: Level!
    var lv = 1
    override init(size: CGSize) {
        super.init(size: size)
        //playBackgroundMusic("puyo.caf")
        //runAction(SKAction.playSoundFileNamed("start.mp3", waitForCompletion: false))
        var background = SKSpriteNode(imageNamed: "background")
        background.size.height = self.size.height
        background.size.width = self.size.width
        background.anchorPoint = CGPoint(x:0, y:0)
        let startButton:ActionButton = ActionButton(defaultButtonImage: "startButton1", activeButtonImage: "startButton_1", buttonAction: donothing)
        startButton.position = CGPoint(x: size.width * 0.8, y: size.height * 0.35)
        let levelButton:ActionButton = ActionButton(defaultButtonImage: "levelButton1", activeButtonImage: "levelButton_1", buttonAction: donothing)
        levelButton.position = CGPoint(x: size.width * 0.8, y: size.height * 0.25)
        
        let howToPlayButton:ActionButton = ActionButton(defaultButtonImage: "howToPlayButton1", activeButtonImage: "howToPlayButton_1", buttonAction: chagneLevel)
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
            if self.lv == 1 {
                let scene = GameScene(size: self.size)
                self.view?.presentScene(scene, transition: revel)
            } else if self.lv == 2 {
                let scene = GameSceneTwo(size: self.size)
                self.view?.presentScene(scene, transition: revel)
            }
            
            }]))
    }
    func chagneLevel(){
        lv = (lv + 1) % 2 + 1
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


