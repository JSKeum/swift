//
//  Concentration.swift
//  Concentration
//
//  Created by JSKeum on 03/10/2019.
//  Copyright © 2019 JSKeum. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()
    private var indexOfOneAndOnlyFaceUP: Int? {
        get {
            // closure + extension(저 밑에 있음) 사용 예제
            return cards.indices.filter { cards[$0].isFaceUp}.oneAndOnly
            
//            let faceUpCardIndices = cards.indices.filter { cards[$0].isFaceUp}
//            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
            
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//                //print("for문 도는 중 현재 foundIndex는 : \(foundIndex)")
//
//            }
//            return foundIndex
        }
        set{
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
                //print("setter에서 index와 newValue는 : \(index), \(newValue)")
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "그 \(index)는 카드 index에 포함되어 있지 않아요!")
        if !cards[index].isMatched {
            
            if let matchIndex = indexOfOneAndOnlyFaceUP,
                matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                //                indexOfOneAndOnlyFaceUP = nil
            } else {
                
                //                for flipDownIndex in cards.indices {
                //                    cards[flipDownIndex].isFaceUp = false
                //                }
                //                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUP = index
                
            }
        }
    }
    
    init(numbersOfPairsOfCards: Int) {
        assert(numbersOfPairsOfCards > 0, "numbersOfPairsofCards must be at least 1")
        
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

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}

