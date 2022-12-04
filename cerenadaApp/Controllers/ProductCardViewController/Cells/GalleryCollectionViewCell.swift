//
//  GalleryCollectionViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 04.12.2022.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    let galleryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createViews() {
        
        addSubview(galleryImageView)
        
        NSLayoutConstraint.activate([
        
            galleryImageView.topAnchor.constraint(equalTo: topAnchor),
            galleryImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            galleryImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            galleryImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
        
    }
    
}
