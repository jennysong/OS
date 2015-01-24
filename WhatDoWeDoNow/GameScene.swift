//
//  GameScene.swift
//  WhatDoWeDoNow
//
//  Created by Jenny Song on 2015-01-23.
//  Copyright (c) 2015 OS. All rights reserved.
//

import SpriteKit


let sport01:ActionButton = ActionButton(defaultButtonImage: "sport01", activeButtonImage: "sport01_", buttonAction: donothing1)
let sport02:ActionButton = ActionButton(defaultButtonImage: "sport02", activeButtonImage: "sport02_", buttonAction: donothing2)
let sport03:ActionButton = ActionButton(defaultButtonImage: "sport03", activeButtonImage: "sport03_", buttonAction: donothing3)
let sport04:ActionButton = ActionButton(defaultButtonImage: "sport04", activeButtonImage: "sport04_", buttonAction: donothing4)
let sport05:ActionButton = ActionButton(defaultButtonImage: "sport05", activeButtonImage: "sport05_", buttonAction: donothing5)
let sport06:ActionButton = ActionButton(defaultButtonImage: "sport06", activeButtonImage: "sport06_", buttonAction: donothing6)
let sport07:ActionButton = ActionButton(defaultButtonImage: "sport07", activeButtonImage: "sport07_", buttonAction: donothing7)
let sport08:ActionButton = ActionButton(defaultButtonImage: "sport08", activeButtonImage: "sport08_", buttonAction: donothing8)
let sport09:ActionButton = ActionButton(defaultButtonImage: "sport09", activeButtonImage: "sport09_", buttonAction: donothing9)
let sport10:ActionButton = ActionButton(defaultButtonImage: "sport10", activeButtonImage: "sport10_", buttonAction: donothing10)
let sport11:ActionButton = ActionButton(defaultButtonImage: "sport11", activeButtonImage: "sport11_", buttonAction: donothing11)
let sport12:ActionButton = ActionButton(defaultButtonImage: "sport12", activeButtonImage: "sport12_", buttonAction: donothing12)
let sport13:ActionButton = ActionButton(defaultButtonImage: "sport13", activeButtonImage: "sport13_", buttonAction: donothing13)
let sport14:ActionButton = ActionButton(defaultButtonImage: "sport14", activeButtonImage: "sport14_", buttonAction: donothing14)
let sport15:ActionButton = ActionButton(defaultButtonImage: "sport15", activeButtonImage: "sport15_", buttonAction: donothing15)
var sports: [ActionButton] = []
var numOfTap: Int = 0

class GameScene: SKScene {
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
// shawn ßtest
func donothing1(){
    if(check(sport01, ))
}

func donothing2(){
    check(sport02, count)
}

func donothing3(){
    check(sport03, count)
}

func donothing4(){
    check(sport04, count)
}

func donothing5(){
    check(sport05, count)
}

func donothing6(){
    check(sport06, count)
}

func donothing7(){
    check(sport07, count)
}

func donothing8(){
    check(sport08, count)
}

func donothing9(){
    check(sport09, count)
}

func donothing10(){
    check(sport10, count)
}

func donothing11(){
    check(sport11, count)
}


func donothing12(){
    check(sport12, count)
}

func donothing13(){
    check(sport13, count)
}

func donothing14(){
    check(sport15, count)
}

func donothing15(){
    check(sport14, count)
}

func check(sport: ActionButton, n: Int) -> Bool{
    if(n == 0){
        
    }
    
    if( sports.count >= 15) {
        // both are smart
        count = 0;
    }
    
    if sport == sports[n] {
        return true
    }
    else {
        count = 0;
        return false
    }
}
