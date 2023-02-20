//
//  WriteReviewController+CustomNavigationView.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 19.02.2023.
//

import UIKit

extension WriteReviewViewController {
    
    func createNavigationView() {
        
        view.addSubview(coloredSafeArea)
        view.addSubview(navigationView)
        navigationView.addSubview(navigationTitle)
        
        guard let top = window?.safeAreaInsets.top else { return }
        let safeArea = top < 21 ? 0 : top
        let heightNavigationView = 96 - (top < 21 ? top : 0)
                
        NSLayoutConstraint.activate([
            
            coloredSafeArea.topAnchor.constraint(equalTo: view.topAnchor),
            coloredSafeArea.heightAnchor.constraint(equalToConstant: safeArea),
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
            backImage.bottomAnchor.constraint(equalTo: backButton.bottomAnchor),
            
        ])
    }
    
    @objc func returnButtonTapped() {
        backButton.showAnimation {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
    
