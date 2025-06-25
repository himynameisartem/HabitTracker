//
//  DetailsHabitConfigurator.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol DetailsHabitConfiguratorProtocol: AnyObject {
    func configure(viewController: DetailsHabitViewController)
}

class DetailsHabitConfigurator: DetailsHabitConfiguratorProtocol {
    func configure(viewController: DetailsHabitViewController) {
        let presenter = DetailsHabitPresenter(viewController: viewController)
        let interactor = DetailsHabitInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
