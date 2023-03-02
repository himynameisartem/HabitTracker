//
//  CategoriesCollectionViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 28.02.2023.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    let categoryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        label.layer.cornerRadius = 20
        label.alpha = 0.7
        label.textColor = .white
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addViews()
        setupConstraints()
        
    }
    
    override var isSelected: Bool {
        didSet {

            self.categoryNameLabel.alpha = self.isSelected ? 1 : 0.7
            self.categoryNameLabel.transform = self.isSelected ? CGAffineTransform(scaleX: 1, y: 1) : CGAffineTransform(scaleX: 0.9, y: 0.9)

        }
    }

    
    func addViews() {
        addSubview(categoryNameLabel)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            categoryNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            categoryNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            categoryNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            categoryNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
