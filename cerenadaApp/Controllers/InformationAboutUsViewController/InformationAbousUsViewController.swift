//
//  InformationAbousUsViewController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 22.11.2022.
//

import UIKit

class InformationAbousUsViewController {
    
    let blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        let blurEffect = UIBlurEffect(style: .dark)
        view.effect = blurEffect
        view.alpha = 0
        return view
    }()
    
    let informationView: UIView = {
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
    
    func showInformationVC(viewController: UIViewController, searchController: UISearchController, tableView: UITableView,
                   infoButton: UIButton) {
        
        targetVC = viewController
        targetSearch = searchController
        targetTableView = tableView
        targetInfoButton = infoButton
                
        guard let targetView = viewController.view else { return }
        
        blurView.frame = targetView.bounds
        
        targetView.addSubview(blurView)
        
        let height = CGFloat(13 * 40 + 120) < targetView.frame.height ? CGFloat(13 * 40 + 120) : targetView.frame.width * 1.5
        informationView.frame = CGRect(x: (targetView.frame.width - (targetView.frame.width / 1.11)) / 2,
                                 y: -900,
                                 width: targetView.frame.width / 1.11,
                                 height: height)
                
        targetView.addSubview(informationView)
                
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
                
        informationView.addSubview(titleLabel)
        informationView.addSubview(exitButton)
        

        NSLayoutConstraint.activate([
            
            exitButton.topAnchor.constraint(equalTo: informationView.topAnchor, constant: 10),
            exitButton.trailingAnchor.constraint(equalTo: informationView.trailingAnchor),
            exitButton.heightAnchor.constraint(equalToConstant: 40),
            exitButton.widthAnchor.constraint(equalToConstant: 40),
            
            titleLabel.centerYAnchor.constraint(equalTo: exitButton.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: exitButton.leadingAnchor, constant: 10)
            
        ])

        


        UIView.animate(withDuration: 0.3) {
            
            self.blurView.alpha = Constants.blurAlpha
            viewController.navigationItem.titleView?.alpha = 0
            searchController.searchBar.alpha = 0
            infoButton.alpha = 0
            viewController.tabBarController?.tabBar.isHidden = true
            
        } completion: { done in
            
            searchController.searchBar.isHidden = true
                       
            if done {
                UIView.animate(withDuration: 0.3) {
                    
                    self.informationView.center = targetView.center
                    
                } completion: { done in

                    self.informationView.addSubview(tableView)

                    NSLayoutConstraint.activate([
                        tableView.topAnchor.constraint(equalTo: self.informationView.topAnchor, constant: 50),
                        tableView.leadingAnchor.constraint(equalTo: self.informationView.leadingAnchor, constant: 10),
                        tableView.trailingAnchor.constraint(equalTo: self.informationView.trailingAnchor, constant: -10),
                        tableView.bottomAnchor.constraint(equalTo: self.informationView.bottomAnchor, constant: -10)
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
            
            self.informationView.frame = CGRect(x: (self.targetVC.view.frame.width - (self.targetVC.view.frame.width / 1.11)) / 2,
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
                    self.targetVC.tabBarController?.tabBar.isHidden = false

                    
                } completion: { done in
                    
                    if done {
                        
                        self.informationView.removeFromSuperview()
                        self.blurView.removeFromSuperview()
                    }
                }
            }
        }
    }
}
