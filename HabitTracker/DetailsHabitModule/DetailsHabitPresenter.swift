//
//  DetailsHabitPresenter.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol DetailsHabitPresenterProtocol: AnyObject {
    
}

class DetailsHabitPresenter {
    
    weak var viewController: DetailsHabitViewProtocol!
    var interactor: DetailsHabitInteractorInputProtocol!
    
    init(viewController: DetailsHabitViewProtocol!) {
        self.viewController = viewController
    }
}

extension DetailsHabitPresenter: DetailsHabitPresenterProtocol {
    
}

extension DetailsHabitPresenter: DetailsHabitInteractorOutputProtocol {
    
}
