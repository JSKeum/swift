//
//  ViewController.swift
//  SwiftUIandStoryboardTest
//
//  Created by JSKeum on 2019/11/09.
//  Copyright © 2019 JSKeum. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBSegueAction func addSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView())
    }
    

}

