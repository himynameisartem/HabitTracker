//
//  InputHabitPresenter.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol InputHabitPresenterProtocol: AnyObject {
    
}

class InputHabitPresenter {
    
    weak var viewController: InputHabitViewProtocol!
    var interactor: InputHabitInteractorInputProtocol!
    
    init(viewController: InputHabitViewProtocol) {
        self.viewController = viewController
    }
}

extension InputHabitPresenter: InputHabitPresenterProtocol {
    
}

extension InputHabitPresenter: InputHabitInteractorOutputProtocol {
    
}
