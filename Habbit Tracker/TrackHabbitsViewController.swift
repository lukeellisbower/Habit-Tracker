//
//  SecondViewController.swift
//  Habbit Tracker
//
//  Created by Luke Ellis Bower on 05/08/2020.
//  Copyright © 2020 Luke Bower. All rights reserved.
//

import UIKit

class TrackHabitsViewController: UIViewController, HabitsModelUser, UITableViewDataSource {

    var habbitsModel: HabitsModel = HabitsModel()
    
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
        return self.habitsModel.habits.count
      }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO get cell from queue: tableView.deque...
        let text = habitsModel.habits[indexPath.row].name
        let cell = UITableViewCell()
        cell.textLabel?.text = text
        return cell
    }


}

