//
//  DetailsHabbitPresenter.swift
//  HabbitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol DetailsHabbitPresenterProtocol: AnyObject {
    
}

class DetailsHabbitPresenter {
    
    weak var viewController: DetailsHabbitViewProtocol!
    var interactor: DetailsHabbitInteractorInputProtocol!
    
    init(viewController: DetailsHabbitViewProtocol!) {
        self.viewController = viewController
    }
}

extension DetailsHabbitPresenter: DetailsHabbitPresenterProtocol {
    
}

extension DetailsHabbitPresenter: DetailsHabbitInteractorOutputProtocol {
    
}
