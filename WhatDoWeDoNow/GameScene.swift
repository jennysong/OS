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
    var you = SKSpriteNode(imageNamed: "you")
    var bot = SKSpriteNode(imageNamed: "bot")
    var youBG = SKSpriteNode(imageNamed: "youBG")
    var botBG = SKSpriteNode(imageNamed: "botBG")
    //var singleMode = SKSpriteNode(imageNamed: "singleMode")
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
        
        roundCount.text = "Score: "+String(sportsarray.count)
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

        you.size.height = TileHeight * 0.37623
        you.size.width = self.size.width * 0.220629685
        you.position = CGPoint(x:self.size.width*(-0.35), y:self.size.height*0.48)
        bot.size.height = TileHeight * 0.37623
        bot.size.width = self.size.width * 0.220629685
        bot.position = CGPoint(x:self.size.width*(-0.35), y:self.size.height*0.48)
        
        addChild(you)
        addChild(bot)
        you.hidden = false
        bot.hidden = true
        
        
        anchorPoint = CGPoint(x: 0.5, y:0.45)
        
        youBG.size.height = self.size.height
        youBG.size.width = self.size.width
        youBG.position = CGPoint(x:0, y:self.size.height*0.05)
        
        botBG.size.height = self.size.height
        botBG.size.width = self.size.width
        botBG.position = CGPoint(x:0, y:self.size.height*0.05)
        
        
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
                    highlight(sport)
                    
                    if (checkCorrect(sport)){
                        if(sportsarray.count == numOfTap){
                            sportsarray.append(sport)
                            roundCount.text = "Score: "+String(sportsarray.count)+"0"
                            numOfTap = 0
                            touchable = false
                            
                            //bot start here
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
            selectionSprite.size.width = TileWidth * 0.90
            selectionSprite.size.height = TileHeight * 1.10
            selectionSprite.runAction(SKAction.setTexture(texture))
            
            runAction(SKAction.sequence([SKAction.runBlock{sprite.addChild(self.selectionSprite)}, SKAction.waitForDuration(0.8), SKAction.runBlock{self.selectionSprite.removeFromParent()}]))
           // sprite.addChild(selectionSprite)
            //selectionSprite.alpha = 1.0
        }
        
    }
    
    
    func checkCorrect(sport: Sport) -> Bool{
        if(sportsarray.count == 0){
            return true
        } else if(sportsarray.count == numOfTap){ // first add to the array and every last turn
            return true
        } else if (sport == sportsarray[numOfTap]) {
            return true
        } else {
            return false
        }
    }
    
    
    
    func nextTurn(){
//runAction(SKAction.playSoundFileNamed("change.wav", waitForCompletion: true))
        var waitTime: NSTimeInterval = 0.8 * NSTimeInterval(sportsarray.count+1)
        if (player == 1) {
            player = 2
            println("next turn!: player 2")
            runAction(SKAction.sequence([SKAction.runBlock{self.showPlayer()}, SKAction.waitForDuration(1), SKAction.runBlock{self.botPlay()}, SKAction.waitForDuration(waitTime), SKAction.runBlock{self.nextTurn()}]))
        } else { player = 1
            showPlayer()
            println("next turn!: player 1")}
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
    
    func endScore(){
        switchSceneToResults("score", score: sportsarray.count*10-10)
        reset()
    }
    
    
    
    func switchSceneToResults(string: String) {
        runAction(SKAction.sequence([SKAction.waitForDuration(0.5),SKAction.runBlock(){
            let reveal = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = Result(size: self.size,string: string)
            self.view?.presentScene(scene, transition:reveal)
            }]))
    }
    
    func showPlayer(){
        if (player == 1){
            addChild(youBG)
            youBG.zPosition = 1000
            youBG.runAction(SKAction.sequence([SKAction.waitForDuration(1),SKAction.runBlock(){
                self.touchable = true
                },SKAction.removeFromParent()]))
            bot.hidden = true
            you.hidden = false
        } else {
            addChild(botBG)
            botBG.zPosition = 1000
            botBG.runAction(SKAction.sequence([SKAction.waitForDuration(1),SKAction.runBlock(){
                self.touchable = false
                },SKAction.removeFromParent()]))
            bot.hidden = false
            you.hidden = true
        }
    }
    
    
    func switchSceneToResults(string: String, score: Int) {
        runAction(SKAction.sequence([SKAction.waitForDuration(0.5),SKAction.runBlock(){
            let reveal = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = Result(size: self.size,string: string,score: score)
            self.view?.presentScene(scene, transition:reveal)
            }]))
    }
    
    func botPlay() {
        var skS = SKSpriteNode()
        var randomColumn = Int(arc4random_uniform(5))
        var randomRow = Int(arc4random_uniform(3))
        var randomSport = level.sportAtColumn(randomColumn, row: randomRow)
        sportsarray.append(randomSport!)
        for i in 0 ... (sportsarray.count - 1) {
            var sport: Sport = sportsarray[i]
            if let sprite = sport.sprite {
                runAction(SKAction.sequence([SKAction.waitForDuration(0.8*NSTimeInterval(i)),SKAction.playSoundFileNamed("change.wav", waitForCompletion: false), SKAction.runBlock{
                    let texture = SKTexture(imageNamed: sport.sportType.highlightedSpriteName)
                    skS = SKSpriteNode(texture: texture)
                    skS.size.width = self.TileWidth * 0.90
                    skS.size.height = self.TileHeight * 1.10
                    skS.runAction(SKAction.setTexture(texture))
                    sprite.addChild(skS)
                    skS.runAction(SKAction.sequence([SKAction.waitForDuration(0.6),SKAction.removeFromParent()]))
                    }]))
            }
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





