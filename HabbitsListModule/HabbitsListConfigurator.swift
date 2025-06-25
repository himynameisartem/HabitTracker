//
//  HabbitsListConfigurator.swift
//  HabbitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol HabbitsListConfiguratorProtocol: AnyObject {
    func configure(viewController: HabbitsListViewController)
}

class HabbitsListConfigurator: HabbitsListConfiguratorProtocol {
    func configure(viewController: HabbitsListViewController) {
        let presenter = HabbitsListPresenter(viewController: viewController)
        let interactor = HabbitsListInteractor(presenter: presenter)
        let router = HabbitsListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
