//
//  TodoItem.swift
//  ToDoList
//
//  Created by Sam Bender on 4/13/17.
//  Copyright © 2017 Sam Bender. All rights reserved.
//

import UIKit

class Task: NSObject {
    let title: String
    let due: Date
    
    init(title: String, due: Date) {
        self.title = title
        self.due = due
    }
    
    func insertIntoDB() {
        let db = ManageDatabase.getDB()
        do {
            try db!.run("INSERT INTO Tasks (title, dueDate) VALUES ('\(self.title)', '\(self.due)')")
        } catch {
            print("exception inserting task")
        }
    }
}
