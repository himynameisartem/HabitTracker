//
//  HabitsListInteractor.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol HabitsListInteractorInputProtocol: AnyObject {
    
}

protocol HabitsListInteractorOutputProtocol: AnyObject {
    
}

class HabitsListInteractor {
    
    weak var presenter: HabitsListInteractorOutputProtocol!
    
    init(presenter: HabitsListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
}

extension HabitsListInteractor: HabitsListInteractorInputProtocol {
    
}
