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
    var targetTableView = UITableView()
    var targetInfoButton = UIButton()
    
    struct Constants {
        static let blurAlpha: CGFloat = 1
    }
    
    //MARK: - Show Alert
    
    func showAlert(viewController: UIViewController, searchController: UISearchController, separator: UIView, tableView: UITableView,
                   infoButton: UIButton) {
        
        targetVC = viewController
        targetSearch = searchController
        targetTableView = tableView
        targetInfoButton = infoButton
                
        guard let targetView = viewController.view else { return }
        
        blurView.frame = targetView.bounds
        
        targetView.addSubview(blurView)
        
        let height = CGFloat(13 * 40 + 120) < targetView.frame.height ? CGFloat(13 * 40 + 120) : targetView.frame.width * 1.5
        alertView.frame = CGRect(x: (targetView.frame.width - (targetView.frame.width / 1.11)) / 2,
                                 y: -900,
                                 width: targetView.frame.width / 1.11,
                                 height: height)
                
        targetView.addSubview(alertView)
                
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "ИНФОРМАЦИЯ:"
            label.font = UIFont(name: "helvetica-bold", size: 20)
            label.textColor = .systemGray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
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
                
        alertView.addSubview(titleLabel)
        alertView.addSubview(exitButton)
        

        NSLayoutConstraint.activate([
            
            exitButton.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 10),
            exitButton.trailingAnchor.constraint(equalTo: alertView.trailingAnchor),
            exitButton.heightAnchor.constraint(equalToConstant: 40),
            exitButton.widthAnchor.constraint(equalToConstant: 40),
            
            titleLabel.centerYAnchor.constraint(equalTo: exitButton.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: exitButton.leadingAnchor, constant: 10)
            
        ])

        


        UIView.animate(withDuration: 0.3) {
            
            self.blurView.alpha = Constants.blurAlpha
            viewController.navigationItem.titleView?.alpha = 0
            searchController.searchBar.alpha = 0
            infoButton.alpha = 0
            
        } completion: { done in
            
            searchController.searchBar.isHidden = true
                       
            if done {
                UIView.animate(withDuration: 0.3) {
                    
                    self.alertView.center = targetView.center
                    
                } completion: { done in

                    self.alertView.addSubview(tableView)

                    NSLayoutConstraint.activate([
                        tableView.topAnchor.constraint(equalTo: self.alertView.topAnchor, constant: 50),
                        tableView.leadingAnchor.constraint(equalTo: self.alertView.leadingAnchor, constant: 10),
                        tableView.trailingAnchor.constraint(equalTo: self.alertView.trailingAnchor, constant: -10),
                        tableView.bottomAnchor.constraint(equalTo: self.alertView.bottomAnchor, constant: -10)
                    ])
                    
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
            
            self.alertView.frame = CGRect(x: (self.targetVC.view.frame.width - (self.targetVC.view.frame.width / 1.11)) / 2,
                                          y: -900,
                                          width: self.targetVC.view.frame.width / 1.11,
                                          height: self.targetVC.view.frame.width * 1.62)
            
            self.targetVC.navigationController?.navigationBar.isHidden = false
            self.targetTableView.removeFromSuperview()
            
        } completion: { done in
            
            
                        
            if done {
                
                var count = 0
                for i in infoArray {
                    if i.isOpened {
                        infoArray[count].isOpened = false
                    }
                    count += 1
                }
                self.targetTableView.reloadData()
                
                UIView.animate(withDuration: 0.3) {
                    self.blurView.alpha = 0
                    self.targetVC.navigationItem.titleView?.alpha = 1
                    self.targetSearch.searchBar.isHidden = false
                    self.targetSearch.searchBar.alpha = 1
                    self.targetInfoButton.alpha = 0.5

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
