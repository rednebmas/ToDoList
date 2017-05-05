//
//  TodoItem.swift
//  ToDoList
//
//  Created by Sam Bender on 4/13/17.
//  Copyright © 2017 Sam Bender. All rights reserved.
//

import UIKit

class Task: NSObject {
    var title: String
    let due: Date
    var id: Int64?
    
    init(title: String, due: Date) {
        self.title = title
        self.due = due
    }
    
    init(title: String, due: Date, id: Int64) {
        self.title = title
        self.due = due
        self.id = id
    }
    
    func insertIntoDB() {
        let db = ManageDatabase.getDB()
        do {
            try db!.run("INSERT INTO Tasks (title, dueDate) VALUES ('\(self.title)', '\(self.due)')")
        } catch {
            print("exception inserting task")
        }
    }
    
    func save() {
        let db = ManageDatabase.getDB()
        do {
            let stmt = "UPDATE Tasks SET title = '\(self.title)', dueDate = '\(self.due)' WHERE id = \(self.id!)"
            try db!.run(stmt)
        } catch {
            print("exception inserting task")
        }
    }
    
}
