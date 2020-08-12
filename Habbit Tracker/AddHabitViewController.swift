//
//  AddHabbitViewController.swift
//  Habbit Tracker
//
//  Created by Luke Ellis Bower on 05/08/2020.
//  Copyright © 2020 Luke Bower. All rights reserved.
//

import UIKit

class AddHabitViewController: UIViewController, HabitsModelUser {
    public var habitsModel: HabitsModel = HabitsModel()
    var selectedHabitInstance: HabitInstance?
    var selectedHabit: Habit?
 
    @IBOutlet weak var habitName: UITextField!
    @IBOutlet weak var habitDescription: UITextField!
    
    override func viewDidLoad() {
         super.viewDidLoad()
         self.title = "Add"
        habitName.delegate = self
        habitDescription.delegate = self
     }
    
    @IBAction func addNewHabit(_ sender: UIButton) {
        let newHabit = Habit(
            name: self.habitName.text ?? "",
            description: self.habitDescription.text ?? "0"
        )
        self.habitsModel.addHabit(newHabit: newHabit)
         navigationController?.popViewController(animated: true) // go back
    }

}

extension AddHabitViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
