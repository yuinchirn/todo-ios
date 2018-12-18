//
//  StorageManager.swift
//  todo-ios
//
//  Created by Yuta Chiba on 2018/12/19.
//  Copyright © 2018 xxxx. All rights reserved.
//

import UIKit
import CoreData

class StorageManager {
    
    let persistentContainer: NSPersistentContainer!
    
    //MARK: Init with dependency
    init(container: NSPersistentContainer) {
        self.persistentContainer = container
        self.persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    convenience init() {
        //Use the default container for production environment
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("AppDelegate unavailable")
        }
        self.init(container: appDelegate.persistentContainer)
    }
    
    lazy var backgroundContext: NSManagedObjectContext = {
        return self.persistentContainer.newBackgroundContext()
    }()
    
    //MARK: CRUD
    @discardableResult func insertTodos( name: String ) -> Todos? {
        guard let todos = NSEntityDescription.insertNewObject(forEntityName: "Todos", into: backgroundContext) as? Todos else { return nil }
        todos.name = name
        return todos
    }
    
    func fetchAll() -> [Todos] {
        let request: NSFetchRequest<Todos> = Todos.fetchRequest()
        
        let results = try? persistentContainer.viewContext.fetch(request)
        return results ?? [Todos]()
    }
    
    func remove( objectID: NSManagedObjectID ) {
        let obj = backgroundContext.object(with: objectID)
        backgroundContext.delete(obj)
    }
    
    func save() {
        if backgroundContext.hasChanges {
            do {
                try backgroundContext.save()
            } catch {
                print("Save error \(error)")
            }
        }
        
    }
}
