//
//  ChecklistItem.swift
//  tableView
//
//  Created by JSKeum on 2019/10/30.
//  Copyright © 2019 JSKeum. All rights reserved.
//

import Foundation

//레퍼런스 타입으로 만들기 위해 struct가 아닌 class
class ChecklistItem {
    var title: String = ""
    var detailText: String = ""
    var checked: Bool = false
    var identifier: Int = 0;
    
    func toggleChecked() {
        checked = !checked
    }
}
