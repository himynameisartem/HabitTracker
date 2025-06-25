//
//  InputHabitViewController.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import UIKit

protocol InputHabitViewProtocol: AnyObject {
    
}

class InputHabitViewController: UIViewController {
    
    var presenter: InputHabitPresenterProtocol!
    private let configurator: InputHabitConfiguratorProtocol = InputHabitConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
    }
}

extension InputHabitViewController: InputHabitViewProtocol {
    
}
