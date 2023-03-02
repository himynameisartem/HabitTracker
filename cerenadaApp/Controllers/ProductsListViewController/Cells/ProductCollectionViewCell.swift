//
//  ProductCollectionViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 20.02.2023.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    let tapGesture = UITapGestureRecognizer()
    var images = [Images]()
    
    let galleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.layer.cornerRadius = 10
        cv.showsHorizontalScrollIndicator = false
        cv.clipsToBounds = true
        return cv
    }()
    
    let galleryPageControl: UIPageControl = {
        let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.activityItemsConfiguration = .none
        page.isUserInteractionEnabled = false
        page.numberOfPages = 5
        page.backgroundColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 0.2648230546)
        page.layer.cornerRadius = 15
        page.pageIndicatorTintColor = .systemGray5
        page.currentPageIndicatorTintColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        page.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        return page
    }()
    
    let likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        return button
    }()
    
    let likeImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "heart")
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.layer.cornerRadius = 7
        label.backgroundColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        label.clipsToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        clipsToBounds = true
        
        addViews()
        setupConstraints()
        
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        galleryCollectionView.register(ProductsGalleryCollectionViewCell.self, forCellWithReuseIdentifier: "galleryCell")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        
        addGestureRecognizer(tapGesture)
        addSubview(galleryCollectionView)
        galleryCollectionView.addSubview(galleryPageControl)
        addSubview(likeButton)
//        likeButton.addSubview(likeImage)
        addSubview(nameLabel)
        addSubview(priceLabel)
    }
    
    func setupConstraints() {
        
        
        NSLayoutConstraint.activate([
            
            galleryCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            galleryCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            galleryCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            galleryCollectionView.heightAnchor.constraint(equalToConstant: frame.width * 1.35),
            
            galleryPageControl.bottomAnchor.constraint(equalTo: galleryCollectionView.topAnchor, constant: frame.width * 1.35),
            galleryPageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            likeButton.topAnchor.constraint(equalTo: galleryCollectionView.topAnchor , constant: 5),
            likeButton.trailingAnchor.constraint(equalTo: galleryCollectionView.trailingAnchor, constant: -5),
            likeButton.heightAnchor.constraint(equalToConstant: 20),
            likeButton.widthAnchor.constraint(equalToConstant: 20),
            
//            likeImage.topAnchor.constraint(equalTo: likeButton.topAnchor),
//            likeImage.leadingAnchor.constraint(equalTo: likeButton.leadingAnchor),
//            likeImage.trailingAnchor.constraint(equalTo: likeButton.trailingAnchor),
//            likeImage.bottomAnchor.constraint(equalTo: likeButton.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: galleryCollectionView.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
            
        ])
    }
}

extension ProductCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "galleryCell", for: indexPath) as! ProductsGalleryCollectionViewCell
        
        
        DispatchQueue.main.async {
            cell.imageView.kf.indicatorType = .activity
            cell.imageView.kf.setImage(with: URL(string: self.images[indexPath.row].src.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? self.images[indexPath.row].src))
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        galleryPageControl.currentPage = indexPath.item
    }
}
