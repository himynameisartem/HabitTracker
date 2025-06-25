//
//  ViewController.swift
//  HabbitsListViewController
//
//  Created by Артем Кудрявцев on 24.06.2025.
//

import UIKit

protocol HabbitsListViewProtocol: AnyObject {
    func reloadData()
}

class HabbitsListViewController: UIViewController {
    
    var presenter: HabbitsLIstPresenterProtocol!
    private let configurator: HabbitsListConfiguratorProtocol = HabbitsListConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        view.backgroundColor = .red
    }
}


extension HabbitsListViewController: HabbitsListViewProtocol {
    func reloadData() {
        
    }
}
