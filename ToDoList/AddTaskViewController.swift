//
//  AddTaskViewController.swift
//  ToDoList
//
//  Created by Sam Bender on 3/30/17.
//  Copyright © 2017 Sam Bender. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    var todoItems: [Task]?
    var todoTableViewController: TodoTableViewController?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTaskButtonPressed(_ sender: Any) {
        if self.todoTableViewController != nil {
            todoTableViewController!.todoItems.append(
                Task(title:self.titleTextField.text!, due: self.datePicker.date)
            )
        }
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
