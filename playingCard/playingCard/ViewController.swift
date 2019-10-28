//
//  ViewController.swift
//  playingCard
//
//  Created by JSKeum on 2019/10/15.
//  Copyright © 2019 JSKeum. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...10 {
            if let card = deck.draw() {
                print("\(card)+\n")
            } 
        }
        // Do any additional setup after loading the view.
    }


}

