//
//  HabbitsListPresenter.swift
//  HabbitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol HabbitsLIstPresenterProtocol: AnyObject {
    
}

class HabbitsListPresenter {
    
    weak var viewController: HabbitsListViewProtocol!
    var interactor: HabbitsListInteractorInputProtocol!
    var router: HabbitsListRouterProtocol!
    
    init(viewController: HabbitsListViewProtocol) {
        self.viewController = viewController
    }
    
}

extension HabbitsListPresenter: HabbitsLIstPresenterProtocol {
    
}

extension HabbitsListPresenter: HabbitsListInteractorOutputProtocol {
    
}
