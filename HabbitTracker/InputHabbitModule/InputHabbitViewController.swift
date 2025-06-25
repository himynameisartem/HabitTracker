//
//  InputHabbitViewController.swift
//  HabbitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import UIKit

protocol InputHabbitViewProtocol: AnyObject {
    
}

class InputHabbitViewController: UIViewController {
    
    var presenter: InputHabbitPresenterProtocol!
    private let configurator: InputHabbitConfiguratorProtocol = InputHabbitConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
    }
}

extension InputHabbitViewController: InputHabbitViewProtocol {
    
}
