//
//  AlertViewController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 22.11.2022.
//

import UIKit

class AlertView {
    
    let blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        let blurEffect = UIBlurEffect(style: .dark)
        view.effect = blurEffect
        view.alpha = 0
        return view
    }()
    
    let alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    var targetVC = UIViewController()
    var targetSearch = UISearchController()
    
    struct Constants {
        static let blurAlpha: CGFloat = 1
    }
    
    //MARK: - Show Alert
    
    func showAlert(viewController: UIViewController, searchController: UISearchController, separator: UIView) {
        
        targetVC = viewController
        targetSearch = searchController
                
        guard let targetView = viewController.view else { return }
        
        blurView.frame = targetView.bounds
        
        targetView.addSubview(blurView)
        
        alertView.frame = CGRect(x: 25, y: -900,
                                 width: targetView.frame.width - 40,
                                 height: targetView.frame.height - 140)
                                 
        targetView.addSubview(alertView)
        
        let exitButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.alpha = 0.6
            button.layer.cornerRadius = 20
            button.setImage(UIImage(systemName: "multiply"), for: .normal)
            button.scalesLargeContentImage = true
            button.tintColor = .black
            return button
        }()
        exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        
        alertView.addSubview(exitButton)
        
        
        NSLayoutConstraint.activate([
        
            exitButton.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 10),
            exitButton.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -10),
            exitButton.heightAnchor.constraint(equalToConstant: 40),
            exitButton.widthAnchor.constraint(equalToConstant: 40),
            
        ])

        UIView.animate(withDuration: 0.3) {
            self.blurView.alpha = Constants.blurAlpha
            viewController.navigationItem.titleView?.alpha = 0
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.3) {
                    self.alertView.center = targetView.center
                    searchController.searchBar.isHidden = true
                    
                } completion: { done in
                    
                    if done {
                        
                        viewController.navigationController?.navigationBar.isHidden = true
                        
                    }
                }
            }
        }
    }
    
    //MARK: - Exit Alert
    
    @objc func exitButtonTapped() {
        
        UIView.animate(withDuration: 0.3) {
            
            self.alertView.frame = CGRect(x: 20, y: -900, width: self.targetVC.view.frame.width - 40, height: self.targetVC.view.frame.height / 1.5)
            self.targetVC.navigationController?.navigationBar.isHidden = false
            
        } completion: { done in
            
            if done {
                
                UIView.animate(withDuration: 0.3) {
                    self.blurView.alpha = 0
                    self.targetVC.navigationItem.titleView?.alpha = 1
                    self.targetSearch.searchBar.isHidden = false
                } completion: { done in
                    
                    if done {
                        
                        self.alertView.removeFromSuperview()
                        self.blurView.removeFromSuperview()
                        
                    }
                }
            }
        }
    }
}
