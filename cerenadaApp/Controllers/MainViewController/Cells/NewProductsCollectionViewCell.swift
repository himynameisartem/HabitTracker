//
//  NewProductsCollectionViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 30.10.2022.
//

import UIKit

class NewProductsCollectionViewCell: UICollectionViewCell {
    
    
    let productImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.layer.borderWidth = 0.3
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let productName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "helvetica-bold", size: 10)
        label.contentMode = .center
        return label
    }()
    
    let productPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "helvetica", size: 12)
        label.contentMode = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createViews() {
        addSubview(productImageView)
        addSubview(productName)
        addSubview(productPrice)
        
        NSLayoutConstraint.activate([
        
            productImageView.topAnchor.constraint(equalTo: topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            productImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),

            productName.topAnchor.constraint(equalTo: productImageView.bottomAnchor),
            productName.leadingAnchor.constraint(equalTo: leadingAnchor),
            productName.trailingAnchor.constraint(equalTo: trailingAnchor),
            productName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
            
            productPrice.topAnchor.constraint(equalTo: productName.bottomAnchor),
            productPrice.leadingAnchor.constraint(equalTo: leadingAnchor),
            productPrice.trailingAnchor.constraint(equalTo: trailingAnchor),
            productPrice.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
}

