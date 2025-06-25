//
//  DetailsHabbitConfigurator.swift
//  HabbitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol DetailsHabbitConfiguratorProtocol: AnyObject {
    func configure(viewController: DetailsHabbitViewController)
}

class DetailsHabbitConfigurator: DetailsHabbitConfiguratorProtocol {
    func configure(viewController: DetailsHabbitViewController) {
        let presenter = DetailsHabbitPresenter(viewController: viewController)
        let interactor = DetailsHabbitInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
