//
//  GameScene.swift
//  WhatDoWeDoNow
//
//  Created by Jenny Song on 2015-01-23.
//  Copyright (c) 2015 OS. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let sport01:ActionButton = ActionButton(defaultButtonImage: "sport01", activeButtonImage: "sport01_", buttonAction: donothing)
    let sport02:ActionButton = ActionButton(defaultButtonImage: "sport02", activeButtonImage: "sport02_", buttonAction: donothing)
    let sport03:ActionButton = ActionButton(defaultButtonImage: "sport03", activeButtonImage: "sport03_", buttonAction: donothing)
    let sport04:ActionButton = ActionButton(defaultButtonImage: "sport04", activeButtonImage: "sport04_", buttonAction: donothing)
    let sport05:ActionButton = ActionButton(defaultButtonImage: "sport05", activeButtonImage: "sport05_", buttonAction: donothing)
    let sport06:ActionButton = ActionButton(defaultButtonImage: "sport06", activeButtonImage: "sport06_", buttonAction: donothing)
    let sport07:ActionButton = ActionButton(defaultButtonImage: "sport07", activeButtonImage: "sport07_", buttonAction: donothing)
    let sport08:ActionButton = ActionButton(defaultButtonImage: "sport08", activeButtonImage: "sport08_", buttonAction: donothing)
    let sport09:ActionButton = ActionButton(defaultButtonImage: "sport09", activeButtonImage: "sport09_", buttonAction: donothing)
    let sport10:ActionButton = ActionButton(defaultButtonImage: "sport10", activeButtonImage: "sport10_", buttonAction: donothing)
    let sport11:ActionButton = ActionButton(defaultButtonImage: "sport11", activeButtonImage: "sport11_", buttonAction: donothing)
    let sport12:ActionButton = ActionButton(defaultButtonImage: "sport12", activeButtonImage: "sport12_", buttonAction: donothing)
    let sport13:ActionButton = ActionButton(defaultButtonImage: "sport13", activeButtonImage: "sport13_", buttonAction: donothing)
    let sport14:ActionButton = ActionButton(defaultButtonImage: "sport14", activeButtonImage: "sport14_", buttonAction: donothing)
    let sport15:ActionButton = ActionButton(defaultButtonImage: "sport15", activeButtonImage: "sport15_", buttonAction: donothing)
    
    

    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
        sport01.position = CGPoint(x: size.width * 0.1, y: size.height * 0.2)
        sport02.position = CGPoint(x: size.width * 0.3, y: size.height * 0.2)
        sport03.position = CGPoint(x: size.width * 0.5, y: size.height * 0.2)
        sport04.position = CGPoint(x: size.width * 0.7, y: size.height * 0.2)
        sport05.position = CGPoint(x: size.width * 0.9, y: size.height * 0.2)
        sport06.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        sport07.position = CGPoint(x: size.width * 0.3, y: size.height * 0.5)
        sport08.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        sport09.position = CGPoint(x: size.width * 0.7, y: size.height * 0.5)
        sport10.position = CGPoint(x: size.width * 0.9, y: size.height * 0.5)
        sport11.position = CGPoint(x: size.width * 0.1, y: size.height * 0.8)
        sport12.position = CGPoint(x: size.width * 0.3, y: size.height * 0.8)
        sport13.position = CGPoint(x: size.width * 0.5, y: size.height * 0.8)
        sport14.position = CGPoint(x: size.width * 0.7, y: size.height * 0.8)
        sport15.position = CGPoint(x: size.width * 0.9, y: size.height * 0.8)
        addChild(sport01)
        addChild(sport02)
        addChild(sport03)
        addChild(sport04)
        addChild(sport05)
        addChild(sport06)
        addChild(sport07)
        addChild(sport08)
        addChild(sport09)
        addChild(sport10)
        addChild(sport11)
        addChild(sport12)
        addChild(sport13)
        addChild(sport14)
        addChild(sport15)
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touch = touches.anyObject() as UITouch
//        let location = touch.locationInNode()
    }
    
}

func donothing(){
    
}