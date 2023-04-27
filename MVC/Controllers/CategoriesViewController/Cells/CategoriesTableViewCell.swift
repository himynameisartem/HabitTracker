//
//  CategoriesTableViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 11.03.2023.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addView()
        setupConstraint()
    }
    
    func addView() {
        addSubview(nameLabel)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    
}
