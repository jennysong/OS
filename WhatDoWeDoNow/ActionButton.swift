//
//  actionButton.swift
//  WhatDoWeDoNow
//
//  Created by Jenny Song on 2015-01-23.
//  Copyright (c) 2015 OS. All rights reserved.
//

import Foundation
import SpriteKit

class ActionButton: SKNode {
    var defaultButton: SKSpriteNode
    var activeButton: SKSpriteNode
    var action: () -> Void
    
    init(defaultButtonImage: SKSpriteNode, activeButtonImage: SKSpriteNode, buttonAction: () -> Void) {
        
        defaultButton = defaultButtonImage
        activeButton  = activeButtonImage
        activeButton.hidden = true
        action = buttonAction
        super.init()
        
        
        
        userInteractionEnabled = true
        addChild(defaultButton)
        addChild(activeButton)
        
    }
    
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        activeButton.hidden = false
        defaultButton.hidden = true
        action()
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        activeButton.hidden = true
        defaultButton.hidden = false
    }
    
}


