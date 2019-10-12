//
//  ViewController.swift
//  Assign1
//
//  Created by JSKeum on 24/09/2019.
//  Copyright © 2019 JSKeum. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue:Int = 0
    var targetValue:Int = 0
    var score:Int = 0
    var round:Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var roundLable: UILabel!
    @IBOutlet weak var targetValueLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewGame()
        
        let sliderThumbImage = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(sliderThumbImage, for: .normal)
        
        //currentValue = Int(roundedValue)
        //targetValue = Int.random(in: 1...100)
    }
    
    @IBAction func showTryAlert() {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        score += points
        round += 1
        
        let title: String
        
        if difference == 0 {
            title = "완벽해요"
            points += 100
        } else if difference <= 5 {
            title = "잘했어요"
            points += 50
        } else {
            title = "잘 맞춰 보세요"
        }
        
        let message = "당신 선택한 숫자는 \(currentValue)입니다 \n 점수는 \(points)입니다"
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "창닫기", style: .default, handler: { action in self.startNewRound() })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print("현재 슬라이더의 값은 \(slider.value)")
        currentValue = Int(slider.value)
    }
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentValue = Int(slider.value.rounded())
        targetValue = Int.random(in: 1...100)
        targetValueLabel.text = String(targetValue)
        updateLabel()
    }
    
    func updateLabel() {
        roundLable.text = String(round)
        scoreLable.text = String(score)
    }

}

