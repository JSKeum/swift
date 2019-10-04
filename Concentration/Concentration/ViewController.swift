//
//  ViewController.swift
//  Concentration
//
//  Created by JSKeum on 02/10/2019.
//  Copyright © 2019 JSKeum. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numbersOfPairsOfCards: (cardButtons.count + 1) / 2)
    var flipCard = 0 {
        didSet {
            flipCardCount.text = "Filps: \(flipCard)"
        }
    }
    
    @IBOutlet weak var flipCardCount: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        print("That's your present!")
        flipCard += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            print(cardNumber)
            // print("Card Number : \(cardNumber)")
            //            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            updateViewFromModel()
            // 카드가 매치업되어있으면 배경을 가만색으로 바꿔버리자
            //button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            for MatchedCardIndex in game.cards.indices {
                if game.cards[MatchedCardIndex].isMatched == true {
                    cardButtons[MatchedCardIndex].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                }
            }
        } else {
            print("That'not card")
        }
    }
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) :#colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
            }
        }
    }
    var emojiChoices = ["🎁", "🥎", "📀", "❤️", "🎱", "⛹🏼‍♀️", "🚎", "🛥"]
    var emoji = [Int:String]()
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            print(emojiChoices)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    //    @IBAction func touchCard2(_ sender: UIButton) {
    //        flipCard += 1
    ////        flipCardCount.text = "Flips: \(flipCard)"
    //        flipCard(withEmoji: "🥎", on: sender)
    //        }
    
    
    //    func flipCard(withEmoji emoji: String, on button: UIButton) {
    //        // for debugging
    //        //print("emoji(withEmoji : \(emoji))")
    //
    //        if button.currentTitle == emoji {
    //            button.setTitle("", for: UIControl.State.normal)
    //            button.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    //        } else {
    //            button.setTitle(emoji, for: UIControl.State.normal)
    //
    //            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    //        }
    //
    //    }
}


