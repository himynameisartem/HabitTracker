//
//  InformationViewController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 29.04.2023.
//

import UIKit

class InformationView {
    
    static let informationView = InformationView()
    
    private var frame = CGRect()
    
    private let blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        let blurEffect = UIBlurEffect(style: .dark)
        view.effect = blurEffect
        view.alpha = 0
        return view
    }()
    
    private let informationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private var exitButton = UIButton()
    
    private var targetVC = UIViewController()
    private var targetSearch = UISearchController()
    private var targetTableView = UITableView()
    private var targetInfoButton = UIButton()
    
    func showInformation(viewController: UIViewController, tableView: UITableView) {
            //SetupTargetView
        guard let targetView = viewController.view else { return }
        blurView.frame = targetView.bounds
        frame = targetView.frame

            //SetupUI
        targetView.addSubview(blurView)
        targetView.addSubview(informationView)
        informationView.addSubview(exitButton)
        informationView.addSubview(tableView)
        
            //SetupViewModel
        var viewModel: InformationViewModelProtocol! {
            didSet {
                informationView.frame = viewModel.informationViewFrame(frame: frame)
            }
        }
        viewModel = InformationViewModel()
        
        setupStyle()
        setupConstraints(view: informationView, tableView: tableView)
        tableView.reloadData()
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: informationView.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -10)
        ])
        
            //OpenAnimationInformationView
        UIView.animate(withDuration: 0.3) {
            self.blurView.alpha = BlurInformationView.blurAlpha
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.3) {
                    self.informationView.center = targetView.center
                } completion: { done in
                    if done {
                    }
                }
            }
        }
    }
    
    func setupStyle() {
        exitButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        exitButton.tintColor = .black
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchDown)
    }
    
    func setupConstraints(view: UIView, tableView: UITableView) {
        NSLayoutConstraint.activate([
            exitButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            tableView.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: informationView.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -10)
        ])
    }
    
    
        //CloseAnimationInformationView
    @objc func exitButtonTapped() {
        UIView.animate(withDuration: 0.3) {
            self.informationView.frame = CGRect(x: (self.targetVC.view.frame.width - (self.targetVC.view.frame.width / 1.11)) / 2,
                                                y: -900,
                                                width: self.targetVC.view.frame.width / 1.11,
                                                height: self.targetVC.view.frame.width * 1.62)
        } completion: { done in
            self.blurView.alpha = 0
            if done {
                UIView.animate(withDuration: 0.3) {
                } completion: { done in
                    if done {
                    }
                }
            }
        }
    }
}



