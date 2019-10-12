//
//  Card.swift
//  Concentration
//
//  Created by JSKeum on 03/10/2019.
//  Copyright © 2019 JSKeum. All rights reserved.
//

import Foundation

struct Card //: Hashable 
    // hashable 질문.. 어찌합니까 ...
{
//    var hashValue: Int { return identifier }
//    func hash(into hasher: inout Hasher) {
//        var hashValue: Int { return identifier }
    
//    static func ==(lhs: Card, rhs: Card) -> Bool {
//        return lhs.identifier == rhs.identifer
//    }
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
