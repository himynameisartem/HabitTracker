//
//  PresentationCollectionViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 29.10.2022.
//

import UIKit

class PresentationCollectionViewCell: UICollectionViewCell {
    
    
    let previewImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
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
        addSubview(previewImageView)
        
        NSLayoutConstraint.activate([
        
            previewImageView.topAnchor.constraint(equalTo: topAnchor),
            previewImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            previewImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            previewImageView.bottomAnchor.constraint(equalTo: bottomAnchor)

            
        ])
        
    }
}
