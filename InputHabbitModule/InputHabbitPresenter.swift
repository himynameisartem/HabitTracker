//
//  InputHabbitPresenter.swift
//  HabbitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol InputHabbitPresenterProtocol: AnyObject {
    
}

class InputHabbitPresenter {
    
    weak var viewController: InputHabbitViewProtocol!
    var interactor: InputHabbitInteractorInputProtocol!
    
    init(viewController: InputHabbitViewProtocol) {
        self.viewController = viewController
    }
}

extension InputHabbitPresenter: InputHabbitPresenterProtocol {
    
}

extension InputHabbitPresenter: InputHabbitInteractorOutputProtocol {
    
}
