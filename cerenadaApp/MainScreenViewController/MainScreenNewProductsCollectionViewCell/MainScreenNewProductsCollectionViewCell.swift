//
//  MainScreenNewProductsCollectionViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 27.04.2023.
//

import UIKit

class MainScreenNewProductsCollectionViewCell: UICollectionViewCell {
    
    private let shadowView = UIView()
    private let imageView = UIImageView()
    private let name = UILabel()
    private let price = UILabel()
    
    var viewModel: MainScreenNewProductsCollectionViewCellViewModelProtocol! {
        didSet {
            name.text = viewModel.productName
            price.text = "  \(viewModel.productPrice ?? "")  "
            ImageManager.shared.getImageData(from: viewModel.imageString, imageView: imageView)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupUI()
        setupConstraints()
        
    }
    
    func setupUI() {
        addSubview(shadowView)
        shadowView.addSubview(imageView)
        shadowView.addSubview(name)
        shadowView.addSubview(price)
    }
    
    func setupStyle() {
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.makeShadow()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 0.1
        imageView.layer.borderColor = UIColor.systemGray.cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont(name: "helvetica-bold", size: 10)
        name.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.780241101)
        name.contentMode = .center
        name.numberOfLines = 2
        
        price.translatesAutoresizingMaskIntoConstraints = false
        price.font = UIFont(name: "helvetica", size: 12)
        price.contentMode = .center
        price.textColor = .white
        price.layer.cornerRadius = 8
        price.clipsToBounds = true
        price.backgroundColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -45),
            
            imageView.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: 0),
            
            name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            
            price.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            price.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
