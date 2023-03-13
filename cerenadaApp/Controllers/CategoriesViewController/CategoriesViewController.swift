//
//  CategoriesViewController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 11.03.2023.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    let vc = ProductsListViewController()
    let searchController = UISearchController()
    
    let categoriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        categoriesTableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: "categoriesCell")
        
        addViews()
        setupConstraints()
        
        view.backgroundColor = .systemGray6
    }
    
    func addViews() {
        navigationItem.searchController = searchController
        view.addSubview(categoriesTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            categoriesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            categoriesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoriesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
