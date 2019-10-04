//
//  Concentration.swift
//  Concentration
//
//  Created by JSKeum on 03/10/2019.
//  Copyright © 2019 JSKeum. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUP: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
        
            if let matchIndex = indexOfOneAndOnlyFaceUP,
                matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUP = nil
            } else {
                
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUP = index
                
            }
        }
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//        }
        
    }
    
    init(numbersOfPairsOfCards: Int) {
        for _ in 0..<numbersOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        for index in 0..<cards.count {
            let old = cards[index]
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            cards[index] = cards[randomIndex]
            cards[randomIndex] = old
        }
    }
}
