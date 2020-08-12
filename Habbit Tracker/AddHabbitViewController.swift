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
 
    @IBOutlet weak var habitName: UITextField!
    @IBOutlet weak var habitTimeTarget: UITextField!
    
    override func viewDidLoad() {
         super.viewDidLoad()
         self.title = "Add"
        habitName.delegate = self
        habitTimeTarget.delegate = self
     }
    
    @IBAction func addNewHabit(_ sender: UIButton) {
        let newHabit = Habit(
            name: self.habitName.text ?? "",
            timeTarget: self.habitTimeTarget.text ?? "0"
        )
        self.habitsModel.habits.append(contentsOf: [newHabit])
         navigationController?.popViewController(animated: true) // go back
    }

}

extension AddHabitViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
