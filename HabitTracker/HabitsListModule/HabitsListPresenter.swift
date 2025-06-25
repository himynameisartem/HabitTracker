//
//  HabitsListPresenter.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol HabitsLIstPresenterProtocol: AnyObject {
    
}

class HabitsListPresenter {
    
    weak var viewController: HabitsListViewProtocol!
    var interactor: HabitsListInteractorInputProtocol!
    var router: HabitsListRouterProtocol!
    
    init(viewController: HabitsListViewProtocol) {
        self.viewController = viewController
    }
    
}

extension HabitsListPresenter: HabitsLIstPresenterProtocol {
    
}

extension HabitsListPresenter: HabitsListInteractorOutputProtocol {
    
}
