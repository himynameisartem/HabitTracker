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
    let navigationBarAppearance = UINavigationBar.appearance()
    
    let categoriesClient = CategoriesClient()
    
    let categoriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 10
        tableView.makeShadow()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriesClient.delegate = self
        categoriesClient.request()
                
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        categoriesTableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: "categoriesCell")
        
        addViews()
        setupConstraints()
        
        navigationController?.navigationBar.barTintColor = .systemGray6
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.hidesSearchBarWhenScrolling = false
        
        view.backgroundColor = .systemGray6
    }
    
    func addViews() {
        navigationItem.searchController = searchController
        view.addSubview(categoriesTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            categoriesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            categoriesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categoriesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            categoriesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

extension CategoriesViewController: CategoriesManagerDelegate {
    func updateInterface(_: CategoriesClient, with data: [Categories]) {
        for i in data {
            
//            if i.parent == 0 {
                
                if i.name.contains("Женские") {
                    print(i.name + " " + "\(i.id)")
                } else {
                    print(i.name + " " + "\(i.id)")
                    
//                    for j in data {
//                        if j.parent == i.id {
//                            print("     " + j.name + " " + "\(j.parent)")
//                        }
//                    }
                }
                
//            }
            
        }
    }
    
    
    
}
