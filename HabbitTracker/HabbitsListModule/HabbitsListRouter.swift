//
//  HabbitsListRouter.swift
//  HabbitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol HabbitsListRouterProtocol: AnyObject {
    
}


class HabbitsListRouter {
    weak var viewController: HabbitsListViewController!
    
    init(viewController: HabbitsListViewController) {
        self.viewController = viewController
    }
}

extension HabbitsListRouter: HabbitsListRouterProtocol {
    
}
