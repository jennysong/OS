//
//  Level.swift
//  CookieCrunch
//
//  Created by Younsuk Oh on 1/22/15.
//  Copyright (c) 2015 Younsuk Oh. All rights reserved.
//

import Foundation

let NumColumns = 5
let NumRows = 3

class Level {

    private var sports = Array2D<Sport>(columns: NumColumns, rows: NumRows)
    
    func sportAtColumn(column: Int, row: Int) -> Sport? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return sports[column, row]
    }
    
    func shuffle() -> Set<Sport> {
        return createInitialSports()
    }
    private func createInitialSports() -> Set<Sport> {
        var set = Set<Sport>()
        var shuffleArray = Array(count: 15, repeatedValue: 0)
        var num = 0
        // 1
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                num = Int(arc4random_uniform(15))
                while(true){
                    if(shuffleArray[num] == 0){
                        shuffleArray[num] = 1
                        break;
                    }
                    num = (num + 1) % 15
                }
                
                var sportType = SportType(rawValue: Int(num) + 1)!
                
                // 3
                let sport =  Sport(column: column, row: row, sportType: sportType)
                sports[column, row] = sport
                // 4
                set.addElement(sport)
                num++
            }
        }
        return set
    }
}
