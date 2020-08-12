//
//  Model.swift
//  Habbit Tracker
//
//  Created by Luke Ellis Bower on 05/08/2020.
//  Copyright © 2020 Luke Bower. All rights reserved.
//

import Foundation

protocol HabitsModelUser {
    var habitsModel: HabitsModel { get set }
    var selectedHabit: Habit? { get set }
    var selectedHabitInstance: HabitInstance? { get set }
}

func initTestModelData(model: HabitsModel) {
    model.habits = [
        Habit(name: "Learn Swift", description: "Watch a new video each day"),
        Habit(name: "Development", description: "Make an iOS app"),
    ]
    model.todaysHabits = []
    for habit in model.habits {
        model.todaysHabits.append(HabitInstance(habit: habit, isCompleted: false))
    }
}

class HabitsModel {
    var habits: [Habit]
    var todaysHabits: [HabitInstance]
    init() {
        self.habits = []
        self.todaysHabits = []
    }
    func addHabit(newHabit: Habit) {
        self.habits.append(newHabit)
        self.todaysHabits.append(HabitInstance(habit: newHabit, isCompleted: false))
    }
}

class Habit {
    var name: String
    var description: String
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
}

class HabitInstance {
    var habit: Habit
    var isCompleted: Bool
    init(habit: Habit, isCompleted: Bool) {
        self.habit = habit
        self.isCompleted = isCompleted
    }
}

func getFieldNames(of entity: Any) -> [String] {
    var fieldNames: [String] = []
    for field in Mirror(reflecting: entity).children {
        if let fieldsName = field.label {
            fieldNames.append(fieldsName)
        }
    }
    return fieldNames
}
