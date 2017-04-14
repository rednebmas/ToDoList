//
//  TodoTableViewController.swift
//  ToDoList
//
//  Created by Sam Bender on 3/28/17.
//  Copyright © 2017 Sam Bender. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {

    var todoItems = [
        Task(title: "DomainModel Homework", due: Date()),
        Task(title: "Work on capstone", due: Date()),
        Task(title: "Grade simplecalc", due: Date())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "INFO 449 Todo List"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return self.todoItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TodoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoTableViewCell

        // Configure the cell...
        let task = self.todoItems[indexPath.row]
        
        cell.aLabel.text = task.title
        
        let formatter = DateFormatter()
        formatter.dateFormat = "M/d/yy"
        cell.dateLabel.text = formatter.string(from: task.due)

        return cell
    }
    
    
    @IBAction func addTaskButtonPressed(_ sender: Any) {
        print("got here")

        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc: AddTaskViewController = sb.instantiateViewController(withIdentifier: "AddTaskViewController") as! AddTaskViewController
        vc.todoItems = self.todoItems
        vc.todoTableViewController = self
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
    
    // MARK: - Swipe to delete
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            self.tableView.beginUpdates()
            self.todoItems.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            self.tableView.endUpdates()
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
