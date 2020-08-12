//
//  EditHabitViewController.swift
//  Habbit Tracker
//
//  Created by Luke Ellis Bower on 06/08/2020.
//  Copyright © 2020 Luke Bower. All rights reserved.
//

import UIKit

class EditHabitViewController: UIViewController, HabitsModelUser {
    var habitsModel: HabitsModel = HabitsModel()
    var selectedHabit: Habit?
    var selectedHabitInstance: HabitInstance?

    @IBOutlet weak var habitName: UITextField!
    @IBOutlet weak var habitDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let habit = self.selectedHabit {
            self.habitName.text = habit.name
            self.habitDescription.text = habit.description
        }
    }
}
