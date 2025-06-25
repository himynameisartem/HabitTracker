//
//  HabbitsListInteractor.swift
//  HabbitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol HabbitsListInteractorInputProtocol: AnyObject {
    
}

protocol HabbitsListInteractorOutputProtocol: AnyObject {
    
}

class HabbitsListInteractor {
    
    weak var presenter: HabbitsListInteractorOutputProtocol!
    
    init(presenter: HabbitsListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
}

extension HabbitsListInteractor: HabbitsListInteractorInputProtocol {
    
}
