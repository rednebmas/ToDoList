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
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        do {
            for row in try db!.prepare("SELECT title, dueDate, id FROM Tasks") {
                let title: String = row[0]! as! String
                let dateString: String = row[1]! as! String
                let id: Int64 = row[2]! as! Int64
                let date = dateFormatter.date(from: dateString)
                if (date != nil) {
                    self.items.append(Task(title: title, due: date!, id: id))
                } else {
                    print("date was nil")
                }
            }
        } catch {
            print("error retrieving tasks")
        }
    }

}
