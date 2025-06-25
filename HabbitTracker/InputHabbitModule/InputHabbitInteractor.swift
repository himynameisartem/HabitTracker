//
//  InputHabbitInteractor.swift
//  HabbitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol InputHabbitInteractorInputProtocol: AnyObject {
    
}

protocol InputHabbitInteractorOutputProtocol: AnyObject {
    
}

class InputHabbitInteractor {
    
    weak var presenter: InputHabbitInteractorOutputProtocol!
    
    init(presenter: InputHabbitInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension InputHabbitInteractor: InputHabbitInteractorInputProtocol {
    
}
