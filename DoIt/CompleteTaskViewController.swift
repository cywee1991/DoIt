//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Chan Yan wee on 6/11/18.
//  Copyright © 2018 Chan Yan wee. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    var previousVC = TaskViewController()
    @IBOutlet weak var taskLabel: UILabel!
    var task = Task()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if task.important == true {
            taskLabel.text = "‼️\(task.name)"
        }
        else {
            taskLabel.text = task.name
        }
        
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        previousVC.tasklist.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
    

}
