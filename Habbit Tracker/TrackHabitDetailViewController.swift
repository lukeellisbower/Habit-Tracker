//
//  TrackHabitDetailViewController.swift
//  Habbit Tracker
//
//  Created by Luke Ellis Bower on 06/08/2020.
//  Copyright © 2020 Luke Bower. All rights reserved.
//

import UIKit

class TrackHabitDetailViewController: UIViewController, HabitsModelUser {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    
    var habitsModel: HabitsModel = HabitsModel()
    var selectedHabitInstance: HabitInstance?
    var selectedHabit: Habit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if selectedHabitInstance != nil {
            self.label.text = selectedHabitInstance!.habit.name
            self.completedLabel.text = "Completed: \(selectedHabitInstance!.isCompleted)"
        }
    }
    
    @IBAction func completeTask(_ sender: Any) {
        selectedHabitInstance?.isCompleted = true
        navigationController?.popViewController(animated: true)
    }
    
}
