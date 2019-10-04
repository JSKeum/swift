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
        
        flipCard += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            print(String((cardNumber + 1)) + "번 카드를 뒤집었어요")
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
        
        var notMatched = 0
        for card in game.cards {
            if card.isMatched == false {
                notMatched += 1
            }
        }
        print("\(notMatched/2)쌍의 카드가 남아있어요 \n")
        if notMatched == 0 {
            finishAlert()
        }
    }
    
    func finishAlert() {
        let message = "\(flipCard)번 뒤집고 모두 맞추셨네요!"
        let title = "게임을 종료합니다"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "다시시작", style: .default, handler: { action in self.startNewRound() })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func startNewRound() {
        game = Concentration(numbersOfPairsOfCards: (cardButtons.count + 1) / 2)
        flipCard = 0
        updateViewFromModel()
        emojiChoices = ["🎁", "🥎", "📀", "❤️", "🎱", "⛹🏼‍♀️", "🚎", "🛥"]
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
            print("\(emojiChoices[randomIndex])가 사용돠어 집합에서 제거될겁니다")
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            print("남은 이모지 집합 : \(emojiChoices)")
        }
        return emoji[card.identifier] ?? "?"
    }
}


