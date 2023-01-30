//
//  NewProductsCollectionViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 30.10.2022.
//

import UIKit

class NewProductsCollectionViewCell: UICollectionViewCell {
    
    let shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.makeShadow()
        return view
    }()
    
    let productImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.layer.borderWidth = 0.1
        image.layer.borderColor = UIColor.systemGray.cgColor
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let productName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "helvetica-bold", size: 10)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.780241101)
        label.contentMode = .center
        label.numberOfLines = 2
        return label
    }()
    
    let productPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "helvetica", size: 12)
        label.contentMode = .center
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.6385813328)
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
        
        addSubview(shadowView)
        shadowView.addSubview(productImageView)
        addSubview(productName)
        addSubview(productPrice)
        
        NSLayoutConstraint.activate([
            
            shadowView.topAnchor.constraint(equalTo: topAnchor),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -45),
            
            productImageView.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 10),
            productImageView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 0),
            productImageView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: 0),
            productImageView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: 0),
            
            productName.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 5),
            productName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            productName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
//            productName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
            
//            productPrice.topAnchor.constraint(equalTo: productName.bottomAnchor),
            productPrice.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            productPrice.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            productPrice.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
}

