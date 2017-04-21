//
//  Tasks.swift
//  ToDoList
//
//  Created by Sam Bender on 4/20/17.
//  Copyright © 2017 Sam Bender. All rights reserved.
//

import UIKit

class Tasks: NSObject {
    public var items: [Task]
    
    override init() {
        items = []
    }
    
    func loadFromDB() {
        let db = ManageDatabase.getDB()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        do {
            for row in try db!.prepare("SELECT title, dueDate FROM Tasks") {
                let title: String = row[0]! as! String
                let dateString: String = row[1]! as! String
                let date = dateFormatter.date(from: dateString)
                self.items.append(Task(title: title, due: Date()))
            }
        } catch {
            print("error retrieving tasks")
        }
    }

}
