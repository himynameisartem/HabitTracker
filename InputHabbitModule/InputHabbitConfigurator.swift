//
//  InputHabbitConfigurator.swift
//  HabbitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol InputHabbitConfiguratorProtocol: AnyObject {
    func configure(viewController: InputHabbitViewController)
}

class InputHabbitConfigurator: InputHabbitConfiguratorProtocol {
    func configure(viewController: InputHabbitViewController) {
        let presenter = InputHabbitPresenter(viewController: viewController)
        let interactor = InputHabbitInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
