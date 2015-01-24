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
var sportsarray = Array<ActionButton>()
var numOfTap: Int = 0
var sportsarrayCount: Int = 0

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
    if (checkCorrect(sport01)){
        if (sportsarrayCount == numOfTap) {
            sportsarray.append(sport01)
            sportsarrayCount++
            println("sportarray\(sportsarray[numOfTap])")
            numOfTap == 0
            nextTurn()
            return
        }
        numOfTap++
    } else {
        
        whoWon()
    }
}

func donothing2(){
    if (checkCorrect(sport02)){
        if (sportsarrayCount == numOfTap) {
            sportsarray.append(sport02)
            sportsarrayCount++
            println("sportarray\(sportsarray[numOfTap])")
            numOfTap == 0
            nextTurn()
            return
        }
        numOfTap++
    } else {
        
        whoWon()
    }
}

func donothing3(){
    if (checkCorrect(sport03)){
        if (sportsarray.count == numOfTap) {
            sportsarray += [sport03]
            numOfTap == 0
            nextTurn()
        }
        numOfTap++
    } else {
        
        whoWon()
    }
}

func donothing4(){
    if (checkCorrect(sport04)){
        if (sportsarray.count == numOfTap) {
            sportsarray += [sport04]
            numOfTap == 0
            nextTurn()
        }
        numOfTap++
    } else {
        
        whoWon()
    }
}

func donothing5(){
    if (checkCorrect(sport05)){
        if (sportsarray.count == numOfTap) {
            sportsarray += [sport05]
            numOfTap == 0
            nextTurn()
        }
        numOfTap++
    } else {
        
        whoWon()
    }
}

func donothing6(){
    if (checkCorrect(sport06)){
        if (sportsarray.count == numOfTap) {
            sportsarray += [sport06]
            numOfTap == 0
            nextTurn()
        }
        numOfTap++
    } else {
        
        whoWon()
    }
}

func donothing7(){
    if (checkCorrect(sport07)){
        if (sportsarray.count == numOfTap) {
            sportsarray += [sport07]
            numOfTap == 0
            nextTurn()
        }
        numOfTap++
    } else {
        
        whoWon()
    }
}

func donothing8(){
    if (checkCorrect(sport08)){
        if (sportsarray.count == numOfTap) {
            sportsarray += [sport08]
            numOfTap == 0
            nextTurn()
        }
        numOfTap++
    } else {
        
        whoWon()
    }
}

func donothing9(){
    if (checkCorrect(sport09)){
        if (sportsarray.count == numOfTap) {
            sportsarray += [sport09]
            numOfTap == 0
            nextTurn()
        }
        numOfTap++
    } else {
        
        whoWon()
    }
}

func donothing10(){
    if (checkCorrect(sport10)){
        if (sportsarray.count == numOfTap) {
            sportsarray += [sport10]
            numOfTap == 0
            nextTurn()
        }
        numOfTap++
    } else {
        
        whoWon()
    }
}

func donothing11(){
    if (checkCorrect(sport11)){
        if (sportsarray.count == numOfTap) {
            println("hello!!")
            sportsarray.insert(sport11, atIndex: numOfTap)
            numOfTap == 0
            nextTurn()
        }
        numOfTap++
    } else {
        
        whoWon()
    }
}

func donothing12(){
    if (checkCorrect(sport12)){
        if (sportsarray.count == numOfTap) {
            sportsarray += [sport12]
            numOfTap == 0
            nextTurn()
        }
        numOfTap++
    } else {
        
        whoWon()
    }
}

func donothing13(){
    if (checkCorrect(sport13)){
        if (sportsarray.count == numOfTap) {
            sportsarray += [sport13]
            numOfTap == 0
            nextTurn()
        }
        numOfTap++
    } else {
        
        whoWon()
    }
}

func donothing14(){
    if (checkCorrect(sport14)){
        if (sportsarray.count == numOfTap) {
            sportsarray += [sport14]
            numOfTap == 0
            nextTurn()
        }
        numOfTap++
    } else {
        
        whoWon()
    }
}

func donothing15(){
    if (checkCorrect(sport15)){
        if (sportsarray.count == numOfTap) {
            sportsarray += [sport15]
            numOfTap == 0
            nextTurn()
        }
        numOfTap++
    } else {
        
        whoWon()
    }
}



func checkCorrect(sport: ActionButton) -> Bool{
    println("number of tab = \(numOfTap)")
    println("sportarray count = \(sportsarray.endIndex)")
    if( sportsarrayCount >= 15) {
        bothWin()
        println("h1")
    }
    if(sportsarrayCount == 0){
        println("h2")
        return true
    }
    if(sportsarrayCount == numOfTap){ // first add to the array and every last turn
        println("h3")
        return true
    }
    if (sport.defaultButton.anchorPoint == sportsarray[numOfTap].defaultButton.anchorPoint) {
        println("h4")
        return true
    }
    else {
        println("false")
        return false
   }
}

func lost(){
    println("you lost!")
    reset()
}

func bothWin(){
    println("both win!")
    reset()
    
}

func nextTurn(){
    println("next turn!")
    reset()
    
}

func reset(){
    println("reset")
    numOfTap = 0
    sportsarray = []
}

func whoWon(){
    println("someone won")
}
