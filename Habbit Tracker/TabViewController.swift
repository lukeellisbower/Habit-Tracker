//
//  TabViewController.swift
//  Habbit Tracker
//
//  Created by Luke Ellis Bower on 06/08/2020.
//  Copyright © 2020 Luke Bower. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Model creation and distribution to top level view controllers
        let model = HabitsModel()
        initTestModelData(model: model)
        guard let navigationControllers = self.viewControllers
            else { return }
        for (_, viewController) in navigationControllers.enumerated() {
            if let navigationController = viewController as? UINavigationController,
                var habitsModelUser = navigationController.viewControllers.first as? HabitsModelUser {
                habitsModelUser.habitsModel = model
            }
        }
    }

}
