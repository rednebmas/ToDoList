//
//  ManageDatabase.swift
//  ToDoList
//
//  Created by Sam Bender on 4/20/17.
//  Copyright © 2017 Sam Bender. All rights reserved.
//

import UIKit
import SQLite

class ManageDatabase: NSObject {
    public static let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/db.sqlite3"
    
    static func createDBIfNeeded() {
        let url = NSURL(fileURLWithPath: ManageDatabase.filePath)
        print(url)
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: url.path!) {
            print("FILE AVAILABLE")
        } else {
            do {
                let db = try Connection(filePath)
                ManageDatabase.createTasksTable(db: db)
            } catch  {
                print("exception")
            }
        }
    }
    
    static func createTasksTable(db: Connection) {
        let tasks = Table("Tasks")
        let id = Expression<Int64>("id")
        let title = Expression<String?>("title")
        let dueDate = Expression<Date>("dueDate")
        
        do {
            try db.run(tasks.create { t in
                t.column(id, primaryKey: true)
                t.column(title)
                t.column(dueDate)
            })
        } catch {
            print("excpetion creating db")
        }
    }
    
    static func getDB() -> Connection? {
        do {
            let db = try Connection(filePath)
            return db
        } catch  {
            return nil
        }
    }

}
