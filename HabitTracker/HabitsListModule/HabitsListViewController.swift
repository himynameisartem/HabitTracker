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
    
    var habitsListTableView: UITableView!
    var presenter: HabitsLIstPresenterProtocol!
    
    private let configurator: HabitsListConfiguratorProtocol = HabitsListConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        setupNavigationController()
        setupTableView()
    }
    
    private func setupNavigationController() {
        navigationItem.title = "Habits"
    }
    
    private func setupTableView() {
        habitsListTableView = UITableView()
        habitsListTableView.delegate = self
        habitsListTableView.dataSource = self
    }
    
}

extension HabitsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}


extension HabitsListViewController: HabitsListViewProtocol {
    func reloadData() {
        
    }
}
