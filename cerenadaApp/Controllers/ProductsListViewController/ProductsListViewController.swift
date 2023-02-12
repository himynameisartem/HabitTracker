//
//  ProductsListViewController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 11.02.2023.
//

import UIKit

class ProductsListViewController: UIViewController {
        
    let navigationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        return view
    }()
        
    let tf: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.autorepeat = true
        stepper.minimumValue = 1
        stepper.stepValue = 1
        stepper.maximumValue = 100
        return stepper
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .systemGray6
        
        tf.text = String(stepper.value)
        
        stepper.addTarget(self, action: #selector(step1), for: .valueChanged)
        
        addViews()
        setupConstraints()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .none
        
    }
    
    @objc func step1() {
        
        tf.text = String(stepper.value)

        
    }
    
    //MARK: - Create Views
    
    func addViews() {
        view.addSubview(navigationView)
        view.addSubview(stepper)
        view.addSubview(tf)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            navigationView.topAnchor.constraint(equalTo: view.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: (navigationController?.navigationBar.frame.height)!),
            
            tf.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            tf.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stepper.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}
