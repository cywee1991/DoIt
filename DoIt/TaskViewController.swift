//
//  TaskViewController.swift
//  DoIt
//
//  Created by Chan Yan wee on 4/11/18.
//  Copyright © 2018 Chan Yan wee. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var tasklist : [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tasklist = makeTask()
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasklist.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        let task = tasklist[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasklist[indexPath.row]
        
        if task.important == true {
            cell.textLabel?.text = "‼️\(task.name)"
        }
        else {
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    func makeTask() -> [Task] {
        
        let task1 = Task()
        task1.name = "Walk My Dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Do Homework"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Clean my House"
        task3.important = true
        
        return [task1, task2, task3]
    }
    
    @IBAction func next(_ sender: Any) {
        performSegue(withIdentifier: "nextSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "nextSegue"{
            let nextVC = segue.destination as! CreateTaskViewController
            
            nextVC.previousVC = self
        }
        
        if segue.identifier == "selectTaskSegue"{
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
        
    }
    
    
}

