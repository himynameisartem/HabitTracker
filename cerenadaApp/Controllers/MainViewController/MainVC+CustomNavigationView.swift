//
//  MainVC+CustomNavigationView.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 09.02.2023.
//

import UIKit

extension MainViewController {
    
    func createNavigationView() {
        let navView = UIView()
        
        navView.translatesAutoresizingMaskIntoConstraints = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
        infoButton.addTarget(self, action: #selector(infoTapped), for: .touchUpInside)
        
        navView.addSubview(infoButton)
        
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let top = window?.safeAreaInsets.top
        
        navBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: (top ?? 0) + 93)
        view.addSubview(navBar)
        navBar.addSubview(navLogo)
        
        NSLayoutConstraint.activate([
            
            navLogo.centerXAnchor.constraint(equalTo: navBar.centerXAnchor),
            navLogo.topAnchor.constraint(equalTo: navBar.topAnchor, constant: (top ?? 0)),
            navLogo.heightAnchor.constraint(equalToConstant: 80),
            navLogo.widthAnchor.constraint(equalToConstant: 160),
            
            navView.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            navView.heightAnchor.constraint(equalToConstant: 44),
            
            infoButton.bottomAnchor.constraint(equalTo: navView.bottomAnchor),
            infoButton.trailingAnchor.constraint(equalTo: navView.trailingAnchor),
            infoButton.widthAnchor.constraint(equalToConstant: 40),
            infoButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        navigationItem.titleView = navView
    }
}
