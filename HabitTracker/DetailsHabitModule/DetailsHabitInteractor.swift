//
//  DetailsHabitUnteractor.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol DetailsHabitInteractorInputProtocol: AnyObject {
    
}

protocol DetailsHabitInteractorOutputProtocol: AnyObject {
    
}

class DetailsHabitInteractor {
    
    weak var presenter: DetailsHabitInteractorOutputProtocol!
    
    init(presenter: DetailsHabitInteractorOutputProtocol!) {
        self.presenter = presenter
    }
}

extension DetailsHabitInteractor: DetailsHabitInteractorInputProtocol {
    
}
