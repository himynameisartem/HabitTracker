//
//  NewProductGalleryCollectionViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 10.05.2023.
//

import UIKit

class NewProductGalleryCollectionViewCell: UICollectionViewCell {
    
    private let galleryImageView = UIImageView()
    var indexPath = IndexPath()
    
    var viewModel: NewProductGalleryCollectionViewCellViewModelProtocol! {
        didSet {
            guard let image = viewModel.images else { return }
            ImageManager.shared.getImageData(from: image.src, imageView: galleryImageView, width: frame.width)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupStyle()
        setupConstraints()
    }
    
    private func setupUI() {
        addSubview(galleryImageView)
    }
    
    private func setupStyle() {
        galleryImageView.translatesAutoresizingMaskIntoConstraints = false
        galleryImageView.contentMode = .scaleAspectFill
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            galleryImageView.topAnchor.constraint(equalTo: topAnchor),
            galleryImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            galleryImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            galleryImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
