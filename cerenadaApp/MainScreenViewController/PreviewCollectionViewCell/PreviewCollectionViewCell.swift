//
//  PreviewCollectionViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 09.05.2023.
//

import UIKit

class PreviewCollectionViewCell: UICollectionViewCell {
    
    private let previewImageView = UIImageView()
    var viewModel: PreviewCollectionViewModelProtocol! {
        didSet {
            previewImageView.image = UIImage(named: viewModel.imageString)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupStyle()
        setupConstraint()
    }
    
    private func setupUI() {
        addSubview(previewImageView)
    }
    
    private func setupStyle() {
        previewImageView.translatesAutoresizingMaskIntoConstraints = false
        previewImageView.contentMode = .scaleAspectFill
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            previewImageView.topAnchor.constraint(equalTo: topAnchor),
            previewImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            previewImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            previewImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

