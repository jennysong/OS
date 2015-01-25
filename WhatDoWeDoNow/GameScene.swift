//
//  GameScene2.swift
//  WhatDoWeDoNow
//
//  Created by Younsuk Oh on 1/24/15.
//  Copyright (c) 2015 OS. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
    var level: Level!
    
    let gameLayer = SKNode()
    let sportsLayer = SKNode()
    var TileWidth = CGFloat(130)
    var TileHeight = CGFloat(105)
    var selectionSprite = SKSpriteNode()
    var sportsarray = Array<Sport>()
    var numOfTap: Int = 0
    var player:Int = 1
    var player1 = SKSpriteNode(imageNamed: "player1")
    let roundCount = SKLabelNode(fontNamed: "AppleSDGothicNeo-Bold")
    
    
    override init(size: CGSize) {
        super.init(size: size)
        roundCount.text = "Score: "+String(sportsarray.count)
        roundCount.fontSize = 20
        roundCount.fontColor = SKColor.whiteColor()
        roundCount.position = CGPoint(x: self.size.width*0, y: self.size.height*0.45)
        addChild(roundCount)
        
        //let goBack:ActionButton = ActionButton(defaultButtonImage: "goBackToStart", activeButtonImage: "goBackToStart_", buttonAction: goBackToStart)
        //goBack.position = CGPoint(x: size.width * 0.35, y: size.height * 0.48)
        //addChild(goBack)

        
        player1.position = CGPoint(x:self.size.width*(-0.35), y:self.size.height*0.48)
        addChild(player1)
        anchorPoint = CGPoint(x: 0.5, y:0.45)
        //        let background = SKSpriteNode(imageNamed: "Background")
        backgroundColor = SKColor.blackColor()
        addChild(gameLayer)
        let layerPosition = CGPoint(x: -TileWidth * CGFloat(NumColumns) / 2, y: -TileHeight * CGFloat(NumRows) / 2)
        sportsLayer.position = layerPosition
        gameLayer.addChild(sportsLayer)
        
        level = Level()
        beginGame()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSpritesForSports(sports: Set<Sport>) {
        println(sports)
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
    
    func beginGame() {
        shuffle()
    }
    
    func shuffle() {
        let newSports = level.shuffle()
        addSpritesForSports(newSports)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touch = touches.anyObject() as UITouch
        let location = touch.locationInNode(sportsLayer)
        
        let (success, column, row) = touchPoint(location)
        if success {
            runAction(SKAction.playSoundFileNamed("button.wav", waitForCompletion: false))
            if let sport = level.sportAtColumn(column,  row: row){
                highlight(sport)
                
                if (checkCorrect(sport)){
                    if(sportsarray.count == numOfTap){
                        sportsarray.append(sport)
                        roundCount.text = "Score: "+String(sportsarray.count)+"0"
                        numOfTap == 0
                        println("doesn't come here")
                        nextTurn()
                        
                        return
                    }
                    numOfTap++
                } else {
                    endScore()
                }
            }
        }
    }
    
    func touchPoint(point: CGPoint) -> (sucess: Bool, column: Int, row: Int) {
        if point.x >= 0 && point.x < CGFloat(NumColumns)*TileWidth && point.y >= 0 && point.y < CGFloat(NumRows)*TileHeight {
            return (true, Int(point.x / TileWidth), Int(point.y / TileHeight))
        } else {
            return (false, 0, 0)
        }
    }
    
    func highlight(sport: Sport) {
        if selectionSprite.parent != nil {
            selectionSprite.removeFromParent()
        }
        
        if let sprite = sport.sprite {
            let texture = SKTexture(imageNamed: sport.sportType.highlightedSpriteName)
            selectionSprite.size = texture.size()
            selectionSprite.runAction(SKAction.setTexture(texture))
            
            sprite.addChild(selectionSprite)
            selectionSprite.alpha = 1.0
        }

    }
    
    
    func checkCorrect(sport: Sport) -> Bool{
        println("number of tab = \(numOfTap)")
        println("sportarray count = \(sportsarray.endIndex)")
        
        if(sportsarray.count == 0){
            println("start: Player \(player)")
            return true
        }
        if(sportsarray.count == numOfTap){ // first add to the array and every last turn
            println("last turn")
            return true
        }
        if (sport == sportsarray[numOfTap]) {
            println("correct")
            return true
        }
        else {
            println("wrong")
            return false
        }
    }
    
    
    
    func nextTurn(){
        runAction(SKAction.playSoundFileNamed("change.wav", waitForCompletion: true))
        if (player == 1) {
            player = 2
            println("next turn!: player 2")
            botPlay()
        }
        else { player = 1
            println("next turn!: player 1")}
        
        if selectionSprite.parent != nil {
            selectionSprite.runAction(SKAction.sequence([SKAction.waitForDuration(1),SKAction.removeFromParent()]))}
        numOfTap = 0
        
    }
    
    func reset(){
        println("reset")
        numOfTap = 0
        player = 1
        sportsarray = []
        if selectionSprite.parent != nil {
            selectionSprite.runAction(SKAction.sequence([SKAction.waitForDuration(1),SKAction.removeFromParent()]))
        }
    }
    
    func endScore(){
        switchSceneToResults("score", score: sportsarray.count*10)
        reset()
    }
    
    
    
    func switchSceneToResults(string: String) {
        runAction(SKAction.sequence([SKAction.waitForDuration(0.5),SKAction.runBlock(){
            let reveal = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = Result(size: self.size,string: string)
            self.view?.presentScene(scene, transition:reveal)
            }
            ]))
    }
    
    func switchSceneToResults(string: String, score: Int) {
        runAction(SKAction.sequence([SKAction.waitForDuration(0.5),SKAction.runBlock(){
            let reveal = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = Result(size: self.size,string: string,score: score)
            self.view?.presentScene(scene, transition:reveal)
            }
            ]))
    }
    
    
    func botPlay() {
        var skS = SKSpriteNode()
        println("bot is playing")
        
        var randomColumn = Int(arc4random_uniform(5))
        var randomRow = Int(arc4random_uniform(3))
        var randomSport = level.sportAtColumn(randomColumn, row: randomRow)
        sportsarray.append(randomSport!)
        println("added\(randomSport!)")
        for i in 0 ... (sportsarray.count - 1) {
            println("what happens here?")
            
            var sport: Sport = sportsarray[i]
            if let sprite = sport.sprite {


                runAction(SKAction.sequence([SKAction.waitForDuration(1*NSTimeInterval(i)),SKAction.playSoundFileNamed("change.wav", waitForCompletion: false), SKAction.runBlock{
                        let texture = SKTexture(imageNamed: sport.sportType.highlightedSpriteName)
                        skS = SKSpriteNode(texture: texture)
                        skS.size = texture.size()
                        skS.runAction(SKAction.setTexture(texture))
                        sprite.addChild(skS)
                        skS.runAction(SKAction.sequence([SKAction.waitForDuration(1),SKAction.removeFromParent()]))
                    }]))

            }
            
        }

        nextTurn()
    }
    
    func goBackToStart(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = GameStart(size: self.size)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    
}





