//
//  InputHabitConfigurator.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol InputHabitConfiguratorProtocol: AnyObject {
    func configure(viewController: InputHabitViewController)
}

class InputHabitConfigurator: InputHabitConfiguratorProtocol {
    func configure(viewController: InputHabitViewController) {
        let presenter = InputHabitPresenter(viewController: viewController)
        let interactor = InputHabitInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
