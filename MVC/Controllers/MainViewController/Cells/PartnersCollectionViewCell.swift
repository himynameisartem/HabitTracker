//
//  PartnersCollectionViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 31.10.2022.
//

import UIKit

class PartnersCollectionViewCell: UICollectionViewCell {
    
    let partnersImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
//        image.layer.borderWidth = 0.3
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createViews() {
        addSubview(partnersImageView)
        
        NSLayoutConstraint.activate([
        
            partnersImageView.topAnchor.constraint(equalTo: topAnchor),
            partnersImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            partnersImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            partnersImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
    }
}
