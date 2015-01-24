//
//  GameScene.swift
//  WhatDoWeDoNow
//
//  Created by Jenny Song on 2015-01-23.
//  Copyright (c) 2015 OS. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let sport01:ActionButton = ActionButton(defaultButtonImage: "sport01", activeButtonImage: "sport01_", buttonAction: donothing())
//    let sport01 = SKSpriteNode(imageNamed: "sport01")
    let sport02 = SKSpriteNode(imageNamed: "sport02")
    let sport03 = SKSpriteNode(imageNamed: "sport03")
    let sport04 = SKSpriteNode(imageNamed: "sport04")
    let sport05 = SKSpriteNode(imageNamed: "sport05")
    let sport06 = SKSpriteNode(imageNamed: "sport06")
    let sport07 = SKSpriteNode(imageNamed: "sport07")
    let sport08 = SKSpriteNode(imageNamed: "sport08")
    let sport09 = SKSpriteNode(imageNamed: "sport09")
    let sport10 = SKSpriteNode(imageNamed: "sport10")
    let sport11 = SKSpriteNode(imageNamed: "sport11")
    let sport12 = SKSpriteNode(imageNamed: "sport12")
    let sport13 = SKSpriteNode(imageNamed: "sport13")
    let sport14 = SKSpriteNode(imageNamed: "sport14")
    let sport15 = SKSpriteNode(imageNamed: "sport15")

    func donothing() -> void {
    }
    
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
    
}