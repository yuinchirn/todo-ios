//
//  ViewController.swift
//  todo-ios
//
//  Created by Yuta Chiba on 2018/12/16.
//  Copyright © 2018 xxxx. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var todos: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Todos")
        
        //3
        do {
            todos = try managedContext.fetch(fetchRequest)
            tableView.reloadData()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
    //セクション数を設定
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //セクションごとのCell数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    //Cell内に表示させる文言などを設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cell")
        let todo = todos[indexPath.row]
        let todoName = todo.value(forKeyPath: "name") as? String
        cell.textLabel?.text = todoName
        return cell
    }
}

