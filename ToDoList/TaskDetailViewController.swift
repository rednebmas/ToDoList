//
//  TaskDetailViewController.swift
//  ToDoList
//
//  Created by Sam Bender on 4/27/17.
//  Copyright © 2017 Sam Bender. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    @IBOutlet weak var taskTitleTextField: UITextField!
    var task: Task?

    override func viewDidLoad() {
        super.viewDidLoad()
        if self.task != nil {
            self.taskTitleTextField.text = task!.title
        }

        
        self.taskTitleTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
    }
    
    func textFieldDidChange(textField: UITextField) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
