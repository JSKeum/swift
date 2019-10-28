//
//  ViewController.swift
//  Concentration
//
//  Created by JSKeum on 02/10/2019.
//  Copyright © 2019 JSKeum. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    private lazy var game = Concentration(numbersOfPairsOfCards: numbersOfPairsOfCards)
    
    var numbersOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCard = 0 {
        didSet {
            updateFlipCard()
        }
    }
    
    private func updateFlipCard() {
        let attributes: [NSAttributedString.Key:Any] = [
            .strokeWidth : 7.0,
            .strokeColor : #colorLiteral(red: 0, green: 0.9068459272, blue: 1, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Filps: \(flipCard)", attributes: attributes)
        
        flipCardCount.attributedText = attributedString
    }
    
    var beforeButton: Int = -1
    
    @IBOutlet private weak var flipCardCount: UILabel! {
        didSet {
            updateFlipCard()
        }
    }
    @IBOutlet private var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        flipCard += 1
        
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            
            if game.cards[cardNumber].isMatched || beforeButton == cardNumber {
                flipCard -= 1
            }
            beforeButton = cardNumber
            
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
        } else if flipCard >= 20 {
            failAlert()
        }
    }
/// Alerts
    func failAlert() {
        let message = "20번 했는데도 못했으니 실패입니다"
        let title = "게임을 종료합니다"
        
        alert(title: title, message: message)
        
    }
    
    func finishAlert() {
        let message = "\(flipCard)번 뒤집고 모두 맞추셨네요!"
        let title = "게임을 종료합니다"
        
        alert(title: title, message: message)
    }
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "다시시작", style: .default, handler: { action in self.startNewRound() })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
///
    
    func startNewRound() {
        game = Concentration(numbersOfPairsOfCards: numbersOfPairsOfCards)
        flipCard = 0
        updateViewFromModel()
        emojiChoices = ["🎁", "🥎", "📀", "❤️", "🎱", "⛹🏼‍♀️", "🚎", "🛥"]
    }
    
    func updateViewFromModel() {
        if cardButtons != nil {
            for index in cardButtons.indices {
                let button = cardButtons[index]
                let card = game.cards[index]
                print(card)
                if card.isFaceUp, card.isMatched != true{
                    button.setTitle(emoji(for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                } else {
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) :#colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
                }
            }
        }
    }
    
    var theme = [String?]()
    {
        didSet {
            emojiChoices = theme as? [String] ?? [""]
            emoji = [:]
            updateViewFromModel()
        }
    }
    
    private var emojiChoices = [String]()
 
    
    //// Card hashable protocol 해야지 가능하다!  Key에 struct를 넣고 싶으면 hashable해야 한다
    private var emoji = [Card:String]()
    
    //    private var emoji = [Int: String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            
            
            
            let randomIndex = emojiChoices.count.arc4random
            //print 때문에 위에 변수로 선언한 것!
            print(randomIndex)
            print("\(emojiChoices[randomIndex])가 사용돠어 집합에서 제거될겁니다")
            emoji[card] = emojiChoices.remove(at: randomIndex)
            print("남은 이모지 집합 : \(emojiChoices)")
        }
        return emoji[card] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}


