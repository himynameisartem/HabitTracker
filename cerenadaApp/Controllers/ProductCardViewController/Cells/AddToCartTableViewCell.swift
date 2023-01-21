//
//  AddToCartTableViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 13.12.2022.
//

import UIKit

class AddToCartTableViewCell: UITableViewCell {
    
    let sizeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 14)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 14)
        label.textColor = .systemGray
        return label
    }()
    
    let coutOrderTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 0.1
        textField.text = "1"
        textField.textColor = .systemGray
        textField.font = UIFont(name: "Helvetica", size: 14)
        textField.textAlignment = .center
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return textField
    }()
    
    let stepperForCountOrder: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.transform = CGAffineTransformMakeScale(0.7, 0.7)
        return stepper
    }()
    
    var addToCartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.makeShadow()
        button.backgroundColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        button.setImage(UIImage(systemName: "cart.fill.badge.plus"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        createViews()
                
    }
    
    func createViews() {
        
        addSubview(sizeLabel)
        addSubview(priceLabel)
        addSubview(coutOrderTextField)
        addSubview(stepperForCountOrder)
        addSubview(addToCartButton)
                
        NSLayoutConstraint.activate([
        
            sizeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            sizeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: sizeLabel.trailingAnchor, constant: 30),
            
            coutOrderTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            coutOrderTextField.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 30),
            coutOrderTextField.widthAnchor.constraint(equalToConstant: 30),
            coutOrderTextField.heightAnchor.constraint(equalToConstant: 30),
            
            stepperForCountOrder.centerYAnchor.constraint(equalTo: centerYAnchor),
            stepperForCountOrder.leadingAnchor.constraint(equalTo: coutOrderTextField.trailingAnchor, constant: 5),
            stepperForCountOrder.widthAnchor.constraint(equalToConstant: 20),
            
            addToCartButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            addToCartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            addToCartButton.heightAnchor.constraint(equalToConstant: 30),
            addToCartButton.widthAnchor.constraint(equalToConstant: 60)
            
        ])
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
