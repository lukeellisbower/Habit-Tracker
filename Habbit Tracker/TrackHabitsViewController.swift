//
//  SecondViewController.swift
//  Habbit Tracker
//
//  Created by Luke Ellis Bower on 05/08/2020.
//  Copyright © 2020 Luke Bower. All rights reserved.
//

import UIKit

class TrackHabitsViewController: UIViewController, HabitsModelUser, UITableViewDataSource, UITableViewDelegate  {
    
    var habitsModel: HabitsModel = HabitsModel()
    var selectedHabitInstance: HabitInstance?
    var selectedHabit: Habit?
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Track"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.habitsModel.todaysHabits.count
      }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO get cell from queue: tableView.deque...
        let habitInstance = self.habitsModel.todaysHabits[indexPath.row]
        let text = habitInstance.habit.name
        let completed = habitInstance.isCompleted
        let cell = UITableViewCell()
        cell.textLabel?.text = text
        if completed {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedHabitInstance = self.habitsModel.todaysHabits[indexPath.row]
        performSegue(withIdentifier: "Show track habit detail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailView = segue.destination as? TrackHabitDetailViewController {
            detailView.habitsModel = self.habitsModel
            detailView.selectedHabitInstance = self.selectedHabitInstance
        }
    }

}

