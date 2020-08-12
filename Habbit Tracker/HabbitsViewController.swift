//
//  FirstViewController.swift
//  Habbit Tracker
//
//  Created by Luke Ellis Bower on 05/08/2020.
//  Copyright © 2020 Luke Bower. All rights reserved.
//

import UIKit

class HabitsViewController: UIViewController, HabitsModelUser, UITableViewDataSource {
    var habitsModel: HabitsModel = HabitsModel()
      
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.habitsModel.habits.count
      }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO get cell from queue: tableView.deque...
        let text = habitsModel.habits[indexPath.row].name
        let cell = UITableViewCell()
        cell.textLabel?.text = text
        return cell
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destination = segue.destination as! HabitsModelUser
        destination.habitsModel = self.habitsModel
    }
}

/**
 so i've got the model out
 but now i want to be able to share this instance with both the controllers
 
 */
