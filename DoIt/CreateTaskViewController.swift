//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Chan Yan wee on 4/11/18.
//  Copyright © 2018 Chan Yan wee. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var createTask: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    var previousVC = TaskViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    @IBAction func tappedAdd(_ sender: Any) {
        let createNewTask = Task()
        createNewTask.name = createTask.text!
        createNewTask.important = importantSwitch.isOn
        
        previousVC.tasklist.append(createNewTask)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)

    }
    
        
    
    
    
   

}
