//
//  ProductsListVC+CustomNavigationController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 20.02.2023.
//

import UIKit

extension ProductsListViewController {
    
    func createNavigationView() {
        
        view.addSubview(coloredSafeArea)
        view.addSubview(navigationView)
        navigationView.addSubview(navigationTitle)
        
        
        navigationTitle.text = categoryName
        
        guard let top = window?.safeAreaInsets.top else { return }
        let heightNavigationView = 96 - (top < 21 ? top : 0)
                
        NSLayoutConstraint.activate([
            
            coloredSafeArea.topAnchor.constraint(equalTo: view.topAnchor),
            coloredSafeArea.heightAnchor.constraint(equalToConstant: top),
            coloredSafeArea.widthAnchor.constraint(equalToConstant: view.frame.width),
            
            navigationView.topAnchor.constraint(equalTo: view.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: heightNavigationView),
                        
            navigationTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigationTitle.centerYAnchor.constraint(equalTo: navigationView.safeAreaLayoutGuide.centerYAnchor),
            navigationTitle.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 50),
            navigationTitle.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -55)
            
        ])
    }
    
    func addBackButton() {
        
        view.addSubview(backButton)
        backButton.addSubview(backImage)

        
        backButton.addTarget(self, action: #selector(returnButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            backButton.centerYAnchor.constraint(equalTo: navigationView.safeAreaLayoutGuide.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            
            backImage.topAnchor.constraint(equalTo: backButton.topAnchor),
            backImage.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            backImage.trailingAnchor.constraint(equalTo: backButton.trailingAnchor),
            backImage.bottomAnchor.constraint(equalTo: backButton.bottomAnchor)
            
        ])
    }
    
    func addSettingsButtons() {
        
        navigationView.addSubview(sortedButton)
        sortedButton.addSubview(sortedButtonImage)
        navigationView.addSubview(filterButton)
        filterButton.addSubview(fiterButtonImage)
        
        sortedButton.addTarget(self, action: #selector(sortedButtonTapped), for: .touchUpInside)
        filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            filterButton.centerYAnchor.constraint(equalTo: navigationView.safeAreaLayoutGuide.centerYAnchor),
            filterButton.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor, constant: -10),
            filterButton.heightAnchor.constraint(equalToConstant: 20),
            filterButton.widthAnchor.constraint(equalToConstant: 20),
            fiterButtonImage.topAnchor.constraint(equalTo: filterButton.topAnchor),
            fiterButtonImage.leadingAnchor.constraint(equalTo: filterButton.leadingAnchor),
            fiterButtonImage.trailingAnchor.constraint(equalTo: filterButton.trailingAnchor),
            fiterButtonImage.bottomAnchor.constraint(equalTo: filterButton.bottomAnchor),
            
            sortedButton.centerYAnchor.constraint(equalTo: navigationView.safeAreaLayoutGuide.centerYAnchor),
            sortedButton.trailingAnchor.constraint(equalTo: filterButton.leadingAnchor, constant: -10),
            sortedButton.heightAnchor.constraint(equalToConstant: 20),
            sortedButton.widthAnchor.constraint(equalToConstant: 20),
            sortedButtonImage.topAnchor.constraint(equalTo: sortedButton.topAnchor),
            sortedButtonImage.leadingAnchor.constraint(equalTo: sortedButton.leadingAnchor),
            sortedButtonImage.trailingAnchor.constraint(equalTo: sortedButton.trailingAnchor),
            sortedButtonImage.bottomAnchor.constraint(equalTo: sortedButton.bottomAnchor)
        ])
        
    }
    
    @objc func returnButtonTapped() {
        backButton.showAnimation {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func sortedButtonTapped(sender: UIButton) {
        sender.showAnimation {
            print("sorted")
        }
    }
    
    @objc func filterButtonTapped(sender: UIButton) {
        sender.showAnimation {
            print("filter")
        }
    }
    
}
