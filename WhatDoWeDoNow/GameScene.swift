//
//  GameScene.swift
//  WhatDoWeDoNow
//
//  Created by Jenny Song on 2015-01-23.
//  Copyright (c) 2015 OS. All rights reserved.
//

import SpriteKit


var sportsarray = Array<ActionButton>()
var numOfTap: Int = 0
var sportsarrayCount: Int = 0

class GameScene: SKScene {
    var level: Level!
    
    let gameLayer = SKNode()
    let sportsLayer = SKNode()
    var TileWidth = CGFloat()
    var TileHeight = CGFloat()
    
    override init(size: CGSize) {
        super.init(size: size)
        anchorPoint = CGPoint(x: 0.5, y:0.5)
//        let background = SKSpriteNode(imageNamed: "Background")
        backgroundColor = SKColor.whiteColor()
        addChild(gameLayer)
        TileWidth = self.size.width
        TileHeight = self.size.height
        let layerPosition = CGPoint(x: -TileWidth * CGFloat(NumColumns) / 2, y: -TileHeight * CGFloat(NumRows) / 2)
        sportsLayer.position = layerPosition
        gameLayer.addChild(sportsLayer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSpritesForSports(sports: Set<Sport>) {
        for sport in sports {
            let sprite = SKSpriteNode(imageNamed: sport.sportType.spriteName)
            sprite.position = pointForColumn(sport.column, row:sport.row)
            sportsLayer.addChild(sprite)
            sport.sprite = sprite
        }
    }
    
    func pointForColumn(column: Int, row: Int) -> CGPoint {
        return CGPoint(x: CGFloat(column)*TileWidth + TileWidth/2, y: CGFloat(row)*TileHeight + TileHeight/2)
    }

    
    func switchSceneToLose() {
        let loseAction = SKAction.runBlock() {
            let reveal = SKTransition.flipHorizontalWithDuration(0.5)
            let gameOverScene = Result(size: self.size, string: "lose")
            self.view?.presentScene(gameOverScene,transition: reveal)
        }
    }
    
    
}



func checkCorrect(sport: ActionButton) -> Bool{
    println("number of tab = \(numOfTap)")
    println("sportarray count = \(sportsarray.endIndex)")
    if( sportsarrayCount >= 15) {
        bothWin()
        println("both win")
    }
    if(sportsarrayCount == 0){
        println("start")
        return true
    }
    if(sportsarrayCount == numOfTap){ // first add to the array and every last turn
        println("last turn")
        return true
    }
    if (sport.defaultButton.texture == sportsarray[numOfTap].defaultButton.texture) {
        println("correct")
        return true
    }
    else {
        println("wrong")
        return false
   }
}

func lost(){
    println("you lost!")
}

func win(){
    println("you won!")
}

func bothWin(){
    println("both win!")
    reset()
    
}

func nextTurn(){
    println("next turn!")
    numOfTap = 0
    
}

func reset(){
    println("reset")
    numOfTap = 0
    sportsarray = []
    sportsarrayCount = 0
}

func whoWon(){
    println("someone won")
    reset()
}


