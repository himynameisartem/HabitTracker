//
//  DetailsHabitViewController.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import UIKit

protocol DetailsHabitViewProtocol: AnyObject {
    
}

class DetailsHabitViewController: UIViewController {
    
    var presenter: DetailsHabitPresenterProtocol!
    private let configurator: DetailsHabitConfiguratorProtocol = DetailsHabitConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
    }
}

extension DetailsHabitViewController: DetailsHabitViewProtocol {
    
}
