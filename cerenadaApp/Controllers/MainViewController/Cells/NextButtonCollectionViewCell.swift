//
//  NextButtonCollectionViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 19.02.2023.
//

import UIKit

class NextButtonCollectionViewCell: UICollectionViewCell {
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        return button
    }()
    
    let buttonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "arrow.right.circle.fill")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createViews() {
        addSubview(nextButton)
        nextButton.addSubview(buttonImage)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
            nextButton.widthAnchor.constraint(equalToConstant: 60),
            
            buttonImage.topAnchor.constraint(equalTo: nextButton.topAnchor),
            buttonImage.leadingAnchor.constraint(equalTo: nextButton.leadingAnchor),
            buttonImage.trailingAnchor.constraint(equalTo: nextButton.trailingAnchor),
            buttonImage.bottomAnchor.constraint(equalTo: nextButton.bottomAnchor)
            
        ])
        
    }
    
    
    
}
