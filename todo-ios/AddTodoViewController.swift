//
//  AddTodoViewController.swift
//  todo-ios
//
//  Created by Yuta Chiba on 2018/12/18.
//  Copyright © 2018 xxxx. All rights reserved.
//

import UIKit
import CoreData

class AddTodoViewController: UIViewController {

    @IBOutlet weak var todoNameTextLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        registerTodo()
        navigationController?.popViewController(animated: true)
    }
    
    func registerTodo() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Todos", in: context)
        let newTodo = NSManagedObject(entity: entity!, insertInto: context)
        
        newTodo.setValue(todoNameTextLabel.text, forKey: "name")
        
        do {
            try context.save()
        } catch {
            print("Failed to register todo")
        }
    }
}
