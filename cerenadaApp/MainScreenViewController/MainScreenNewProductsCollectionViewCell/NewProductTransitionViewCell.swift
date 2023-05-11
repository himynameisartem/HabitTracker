//
//  NewProductTransitionViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 11.05.2023.
//

import UIKit

class NewProductTransitionViewCell: UICollectionViewCell {
    
    private let nextButton = UIButton()
    private let buttonImage = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupStyle()
        setupConstraints()
        
    }
    
    private func setupUI() {
        addSubview(nextButton)
        nextButton.addSubview(buttonImage)
    }

    private func setupStyle() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.tintColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchDown)
        
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        buttonImage.image = UIImage(systemName: "arrow.right.circle.fill")
    }
    
    private func setupConstraints() {
        
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
    
    @objc func nextButtonTapped(sender: UIButton) {
        sender.showAnimation {

        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
