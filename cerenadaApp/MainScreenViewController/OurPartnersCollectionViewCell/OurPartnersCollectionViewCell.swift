//
//  OurPartnersCollectionViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 11.05.2023.
//

import UIKit

class OurPartnersCollectionViewCell: UICollectionViewCell {
    
    private let partnersImageView = UIImageView()
    
    var viewModel: OurPartnersCollectionViewCellViewModelProtocol! {
        didSet {
            guard let image = viewModel.imageString else { return }
            partnersImageView.image = UIImage(named: image)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupStyle()
        setupConstraints()
    }
    
    private func setupUI() {
        addSubview(partnersImageView)
    }
    
    private func setupStyle() {
        partnersImageView.translatesAutoresizingMaskIntoConstraints = false
        partnersImageView.layer.cornerRadius = 10
        partnersImageView.contentMode = .scaleAspectFill
        partnersImageView.clipsToBounds = true
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            partnersImageView.topAnchor.constraint(equalTo: topAnchor),
            partnersImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            partnersImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            partnersImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
