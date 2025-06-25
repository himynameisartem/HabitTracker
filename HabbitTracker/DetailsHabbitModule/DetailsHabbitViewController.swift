//
//  DetailsHabbitViewController.swift
//  HabbitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import UIKit

protocol DetailsHabbitViewProtocol: AnyObject {
    
}

class DetailsHabbitViewController: UIViewController {
    
    var presenter: DetailsHabbitPresenterProtocol!
    private let configurator: DetailsHabbitConfiguratorProtocol = DetailsHabbitConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
    }
}

extension DetailsHabbitViewController: DetailsHabbitViewProtocol {
    
}
