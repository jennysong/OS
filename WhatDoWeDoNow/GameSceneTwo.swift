//
//  GameScene2.swift
//  WhatDoWeDoNow
//
//  Created by Younsuk Oh on 1/24/15.
//  Copyright (c) 2015 OS. All rights reserved.
//

import Foundation
import SpriteKit

class GameSceneTwo: SKScene {
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
    var player2 = SKSpriteNode(imageNamed: "player2")
    var player1bg = SKSpriteNode(imageNamed: "player1bg")
    var player2bg = SKSpriteNode(imageNamed: "player2bg")
    let roundCount = SKLabelNode(fontNamed: "ChalkboardSE-Light")
    var backButton = SKSpriteNode(imageNamed: "backButton")
    var backButton_ = SKSpriteNode(imageNamed: "backButton_")
    var touchable = true
    
    override init(size: CGSize) {
        super.init(size: size)
        self.TileWidth = self.size.width / 5.13
        self.TileHeight = self.size.height / 3.57
        
        var gameBG = SKSpriteNode(imageNamed: "gameBG")
        gameBG.size.height = self.size.height
        gameBG.size.width = self.size.width
        gameBG.position = CGPoint(x:self.size.width*0, y: self.size.height*0.05)
        addChild(gameBG)
        
        roundCount.text = "Round: "+String(sportsarray.count)
        roundCount.fontSize = TileHeight / 5.25
        roundCount.fontColor = SKColor.whiteColor()
        roundCount.position = CGPoint(x: self.size.width*0, y: self.size.height*0.45)
        addChild(roundCount)
        
        let ratio = 1/self.size.height*195
        
        
        backButton.size.height = TileHeight * 0.15346
        backButton.size.width = TileWidth * 0.3395
        backButton.position = CGPoint(x:self.size.width*(0.40), y:self.size.height*0.47)
        backButton.zPosition = 1000
        backButton_.size.height = TileHeight * 0.15346
        backButton_.size.width = TileWidth * 0.3395
        backButton_.position = CGPoint(x:self.size.width*(0.40), y:self.size.height*0.47)
        backButton_.zPosition = 1000


        let goBack:ActionButton = ActionButton(defaultButtonImage: backButton, activeButtonImage: backButton_, buttonAction: goBackToStart)
        addChild(goBack)
        
        player1.size.height = TileHeight * 0.37623
        player1.size.width = TileWidth * 0.962556
        player1.position = CGPoint(x:self.size.width*(-0.35), y:self.size.height*0.48)
        player2.size.height = TileHeight * 0.37623
        player2.size.width = TileWidth * 0.962556
        player2.position = CGPoint(x:self.size.width*(-0.35), y:self.size.height*0.48)
        
        addChild(player1)
        player1.hidden = false
        addChild(player2)
        player2.hidden = true
        
        anchorPoint = CGPoint(x: 0.5, y:0.45)

        player1bg.size.height = self.size.height
        player1bg.size.width = self.size.width
        player1bg.position = CGPoint(x:0, y:self.size.height*0.05)
        
        player2bg.size.height = self.size.height
        player2bg.size.width = self.size.width
        player2bg.position = CGPoint(x:0, y:self.size.height*0.05)
        
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
        for sport in sports {
            let sprite = SKSpriteNode(imageNamed: sport.sportType.spriteName)
            sprite.position = pointForColumn(sport.column, row:sport.row)
            sprite.size.width = TileWidth * 0.74
            sprite.size.height = TileHeight * 0.92
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
        if touchable {
        let touch = touches.anyObject() as UITouch
        let location = touch.locationInNode(sportsLayer)
        
        let (success, column, row) = touchPoint(location)
            if success {
                runAction(SKAction.playSoundFileNamed("button.wav", waitForCompletion: false))
                if let sport = level.sportAtColumn(column,  row: row){
                    showSelectionIndicatorForSport(sport)
                    
                    if (checkCorrect(sport)){
                        if(sportsarray.count == numOfTap){
                            sportsarray.append(sport)
                            roundCount.text = "Round: "+String(sportsarray.count)
                            numOfTap = 0
                            touchable = false
                            nextTurn()
                            return
                        }
                        numOfTap++
                        if( numOfTap == 20 ) {
                            bothWin()
                        }
                    } else {
                        whoWon()
                    }
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
    
    func showSelectionIndicatorForSport(sport: Sport) {
        if selectionSprite.parent != nil {
            selectionSprite.removeFromParent()
        }
        
        if let sprite = sport.sprite {
            let texture = SKTexture(imageNamed: sport.sportType.highlightedSpriteName)
            selectionSprite.size = texture.size()
            selectionSprite.size.width = TileWidth * 0.90
            selectionSprite.size.height = TileHeight * 1.10
            selectionSprite.runAction(SKAction.setTexture(texture))
            
            sprite.addChild(selectionSprite)
            selectionSprite.alpha = 1.0
        }
    }
    
    func hidSelectionIndicator() {
        selectionSprite.runAction(SKAction.sequence([SKAction.waitForDuration(1),SKAction.removeFromParent()]))
    }
    
    func checkCorrect(sport: Sport) -> Bool{

        if(sportsarray.count == 0){
            return true
        }
        if(sportsarray.count == numOfTap){ // first add to the array and every last turn
            return true
        }
        if (sport == sportsarray[numOfTap]) {
            return true
        }
        else {
            return false
        }
    }
    
    
    func bothWin(){
        reset()
        switchSceneToResults("bothWon")
    }
    
    func nextTurn(){
        runAction(SKAction.playSoundFileNamed("change.wav", waitForCompletion: false))
        if (player == 1) { player = 2}
        else { player = 1}
        println("next turn!: player \(player)")
        
        if selectionSprite.parent != nil {
            selectionSprite.runAction(SKAction.sequence([SKAction.waitForDuration(1),SKAction.removeFromParent()]))
        }
        showPlayer()
        
        numOfTap = 0
        
    }
    
    func reset(){
        numOfTap = 0
        player = 1
        sportsarray = []
        if selectionSprite.parent != nil {
            selectionSprite.runAction(SKAction.sequence([SKAction.waitForDuration(1),SKAction.removeFromParent()]))
        }
    }
    
    func whoWon(){
        if (player == 1) { player = 2}
        else { player = 1}
        switchSceneToResults("\(player)Won")
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
    
    func showPlayer(){
        if (player == 1){
            addChild(player1bg)
            player1bg.zPosition = 1000
            player1bg.runAction(SKAction.sequence([SKAction.waitForDuration(1),SKAction.runBlock(){
                self.touchable = true
                },SKAction.removeFromParent()]))
            player2.hidden = true
            player1.hidden = false
        }
        else {
            addChild(player2bg)
            player2bg.zPosition = 1000
            player2bg.runAction(SKAction.sequence([SKAction.waitForDuration(1),SKAction.runBlock(){
                self.touchable = true
                },SKAction.removeFromParent()]))
            player1.hidden = true
            player2.hidden = false
            
        }

    }
    func goBackToStart(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = GameStart(size: self.size)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    
}





