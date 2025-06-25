//
//  HabitsListViewController.swift
//  HabitsTracker
//
//  Created by Артем Кудрявцев on 24.06.2025.
//

import UIKit

protocol HabitsListViewProtocol: AnyObject {
    func reloadData()
}

class HabitsListViewController: UIViewController {
    
    var presenter: HabitsLIstPresenterProtocol!
    private let configurator: HabitsListConfiguratorProtocol = HabitsListConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        view.backgroundColor = .red
    }
}


extension HabitsListViewController: HabitsListViewProtocol {
    func reloadData() {
        
    }
}
