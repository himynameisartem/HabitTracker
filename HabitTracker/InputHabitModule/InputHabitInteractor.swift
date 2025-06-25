//
//  InputHabitInteractor.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol InputHabitInteractorInputProtocol: AnyObject {
    
}

protocol InputHabitInteractorOutputProtocol: AnyObject {
    
}

class InputHabitInteractor {
    
    weak var presenter: InputHabitInteractorOutputProtocol!
    
    init(presenter: InputHabitInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension InputHabitInteractor: InputHabitInteractorInputProtocol {
    
}
