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
    
    var beforeButton: Int = -1
    
    @IBOutlet weak var flipCardCount: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        flipCard += 1
        
        if flipCard > 20 {
            failAlert()
        }
        
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            
            if game.cards[cardNumber].isMatched {
                flipCard -= 1
            } else {
                if beforeButton == cardNumber {
                    print("beforeButton : \(beforeButton)")
                    duplicateAlert()
                }
            }
            beforeButton = cardNumber
            
            // identifier가 같은녀석도 flipcard -=1 한다
            
            game.chooseCard(at: cardNumber)
            print(String((cardNumber + 1)) + "번 카드를 뒤집었어요")
            updateViewFromModel()
            
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
    
    func duplicateAlert() {
        let message = "같은 카드를 선택했습니다"
        let title = "다른 카드를 선택하세요"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "계속하기", style: .default, handler: nil)
        
        flipCard -= 1
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func failAlert() {
        let message = "20번 했는데도 못했으니 실패입니다"
        let title = "게임을 종료합니다"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "다시시작", style: .default, handler: { action in self.startNewRound() })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
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


