//
//  ViewController.swift
//  tableView
//
//  Created by JSKeum on 2019/10/30.
//  Copyright © 2019 JSKeum. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private let rowItems: TodoList
    
    private var numbersOfList = 10
    
    required init?(coder: NSCoder) {
        rowItems = TodoList(numbersOfList: numbersOfList)
        
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 밑에 진짜 좋은 기능!! 이거 UI 만들 때 기본으로 해야
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        print("add Item")
        
        let newRowIndex = rowItems.todos.count
        _ = rowItems.newTodo()
        
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        print(indexPath)
        let indexPaths = [indexPath]
        print(indexPaths)
        tableView.insertRows(at: indexPaths, with: .automatic)
        // 다시 로드해줘야
        tableView.reloadData()
    }
    
    
    
    
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return rowItems.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checklistItem", for: indexPath)
        // let detailCell = tableView.dequeueReusableCell(withIdentifier: "checklistDetail", for: indexPath)
        // 여기서 잘 세팅을 해서 리턴
        
        let item = rowItems.todos[indexPath.row]
        
        //configureCheckmark(for: cell, with: item)
        configureText(for: cell, with: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = rowItems.todos[indexPath.row]
            //configureCheckmark(for: cell, with: item)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // 스와이프 딜리트, 애플 특허임
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        rowItems.todos.remove(at: indexPath.row)
        
        //tableView.reloadData()
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        cell.accessoryType = item.checked ? .checkmark : .none
        item.toggleChecked()
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.detailText
    }
}
