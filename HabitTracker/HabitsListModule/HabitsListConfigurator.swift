//
//  HabitsListConfigurator.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol HabitsListConfiguratorProtocol: AnyObject {
    func configure(viewController: HabitsListViewController)
}

class HabitsListConfigurator: HabitsListConfiguratorProtocol {
    func configure(viewController: HabitsListViewController) {
        let presenter = HabitsListPresenter(viewController: viewController)
        let interactor = HabitsListInteractor(presenter: presenter)
        let router = HabitsListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
