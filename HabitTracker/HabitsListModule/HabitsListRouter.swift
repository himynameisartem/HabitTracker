//
//  HabitsListRouter.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol HabitsListRouterProtocol: AnyObject {
    
}


class HabitsListRouter {
    weak var viewController: HabitsListViewController!
    
    init(viewController: HabitsListViewController) {
        self.viewController = viewController
    }
}

extension HabitsListRouter: HabitsListRouterProtocol {
    
}
