//
//  Sport.swift
//  WhatDoWeDoNow
//
//  Created by Younsuk Oh on 1/24/15.
//  Copyright (c) 2015 OS. All rights reserved.
//

import Foundation
import SpriteKit

enum SportType: Int, Printable{
    case Unknown = 0, sport01, sport02, sport03, sport04, sport05, sport06, sport07, sport08, sport09, sport10, sport11, sport12, sport13, sport14, sport15
    var spriteName: String {
        let spriteNames = [
        "sport01",
        "sport02",
        "sport03",
        "sport04",
        "sport05",
        "sport06",
        "sport07",
        "sport08",
        "sport09",
        "sport10",
        "sport11",
        "sport12",
        "sport13",
        "sport14",
        "sport15"]
        
        return spriteNames[rawValue - 1]
    }
    
    var highlightedSpriteName: String {
        return spriteName + "_"
    }
    
    var description: String {
        return spriteName
    }
    
}

class Sport: Printable, Hashable {
    var column: Int
    var row: Int
    let sportType: SportType
    var sprite: SKSpriteNode?
    
    init(column: Int, row: Int, sportType: SportType) {
        self.column = column
        self.row = row
        self.sportType = sportType
    }
    
    var description: String {
        return "type:\(sportType) square:(\(column),\(row))"
    }
    
    var hashValue: Int {
        return row * 5 + column
    }
    
}


func ==(lhs: Sport, rhs: Sport) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row
}