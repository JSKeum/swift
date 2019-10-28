//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by JSKeum on 2019/10/18.
//  Copyright © 2019 JSKeum. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    let themes = [
        "Stuffs" : ["🎁", "🥎", "📀", "❤️", "🎱", "⛹🏼‍♀️", "🚎", "🛥"],
        "Faces" : ["💀", "😈", "👹", "🤡", "👻", "😵", "💩", "🤢"],
        "Animals" : ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼"]
        
        
    ]

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
                if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]  {
                    if let cvc = segue.destination as? ConcentrationViewController {
                        cvc.theme = theme
                    }
            }
        }
    }
 

}
