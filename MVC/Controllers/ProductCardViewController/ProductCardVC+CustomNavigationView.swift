//
//  ProductCardVC+CustomNavigationView.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 09.02.2023.
//

import UIKit

extension ProductCardViewController {
    
    func createNavigationView() {
        
        view.addSubview(coloredSafeArea)
        view.addSubview(navigationView)
        navigationView.addSubview(navigationTitle)
        
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
        view.addSubview(likeButton)
        likeButton.addSubview(likeImage)
        view.addSubview(sharedButton)
        sharedButton.addSubview(sharedImage)
        
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
            
            sharedButton.centerYAnchor.constraint(equalTo: navigationView.safeAreaLayoutGuide.centerYAnchor),
            sharedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            sharedButton.heightAnchor.constraint(equalToConstant: 20),
            sharedButton.widthAnchor.constraint(equalToConstant: 20),
            
            sharedImage.topAnchor.constraint(equalTo: sharedButton.topAnchor),
            sharedImage.leadingAnchor.constraint(equalTo: sharedButton.leadingAnchor),
            sharedImage.trailingAnchor.constraint(equalTo: sharedButton.trailingAnchor),
            sharedImage.bottomAnchor.constraint(equalTo: sharedButton.bottomAnchor),
            
            likeButton.centerYAnchor.constraint(equalTo: navigationView.safeAreaLayoutGuide.centerYAnchor),
            likeButton.trailingAnchor.constraint(equalTo: sharedButton.leadingAnchor, constant: -5),
            likeButton.heightAnchor.constraint(equalToConstant: 20),
            likeButton.widthAnchor.constraint(equalToConstant: 20),
            
            likeImage.topAnchor.constraint(equalTo: likeButton.topAnchor),
            likeImage.leadingAnchor.constraint(equalTo: likeButton.leadingAnchor),
            likeImage.trailingAnchor.constraint(equalTo: likeButton.trailingAnchor),
            likeImage.bottomAnchor.constraint(equalTo: likeButton.bottomAnchor),
            
        ])
    }
    
    @objc func returnButtonTapped() {
        backButton.showAnimation {
            self.navigationController?.popViewController(animated: true)
//            self.dismiss(animated: true)
        }
    }
}
