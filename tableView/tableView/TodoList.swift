//
//  TakeList.swift
//  tableView
//
//  Created by JSKeum on 2019/10/30.
//  Copyright © 2019 JSKeum. All rights reserved.
//

import Foundation

class TodoList {
    var todos: [ChecklistItem] = []
    init(numbersOfList num: Int) {
        for i in 0..<num {
            let newList = ChecklistItem()
            newList.identifier = i
            newList.title = "체크리스트 + \(i)"
            newList.detailText = "\(i) 번째 체크리스트입니다"
            todos.append(newList)
        }
        
        
    }

    func newTodo() -> ChecklistItem {
        let item = ChecklistItem()
        item.title = "새로운 맇스ㅌ"
        todos.append(item)
        return item
        
    }
}
