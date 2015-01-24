//
//  Set.swift
//  CookieCrunch
//
//  Created by Younsuk Oh on 1/22/15.
//  Copyright (c) 2015 Younsuk Oh. All rights reserved.
//

import Foundation

struct Set<T: Hashable>: SequenceType, Printable {
    private var dictionary = Dictionary<T, Bool>()
    
    mutating func addElement(newElement: T) {
        dictionary[newElement] = true
    }
    
    mutating func removeElement(element: T) {
        dictionary[element] = nil
    }
    
    func containsElement(elemnet: T) -> Bool {
        return dictionary[elemnet] != nil
    }
    
    func allElemnets() -> [T] {
        return Array(dictionary.keys)
    }
    
    var count: Int {
        return dictionary.count
    }
    
    func unionSet(otherSet: Set<T>) -> Set<T> {
        var combined = Set<T>()
        
        for obj in dictionary.keys {
            combined.dictionary[obj] = true
        }
        
        for obj in otherSet.dictionary.keys {
            combined.dictionary[obj] = true
        }
        
        return combined
    }
    
    func generate() -> IndexingGenerator<Array<T>> {
        return allElemnets().generate()
    }
    
    var description: String {
        return dictionary.description
    }
}