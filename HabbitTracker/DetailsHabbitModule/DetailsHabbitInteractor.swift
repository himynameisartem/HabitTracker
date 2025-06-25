//
//  DetailsHabbitUnteractor.swift
//  HabbitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

protocol DetailsHabbitInteractorInputProtocol: AnyObject {
    
}

protocol DetailsHabbitInteractorOutputProtocol: AnyObject {
    
}

class DetailsHabbitInteractor {
    
    weak var presenter: DetailsHabbitInteractorOutputProtocol!
    
    init(presenter: DetailsHabbitInteractorOutputProtocol!) {
        self.presenter = presenter
    }
}

extension DetailsHabbitInteractor: DetailsHabbitInteractorInputProtocol {
    
}
