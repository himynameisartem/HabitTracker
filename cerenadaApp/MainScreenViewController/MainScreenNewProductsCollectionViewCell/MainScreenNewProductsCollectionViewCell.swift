//
//  MainScreenNewProductsCollectionViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 27.04.2023.
//

import UIKit

class MainScreenNewProductsCollectionViewCell: UICollectionViewCell {
    
    private let shadowView = UIView()
    private let galleryCollectionViewLayout = UICollectionViewFlowLayout()
    private var galleryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let galleryPageControl = UIPageControl()
    private let tapTransition = UITapGestureRecognizer()
    private let name = UILabel()
    private let price = UILabel()
    
    var viewModel: MainScreenNewProductsCollectionViewCellViewModelProtocol! {
        didSet {
            name.text = viewModel.productName
            price.text = "  \(viewModel.productPrice ?? "") ₽  "
            guard let count = viewModel.numberOfItems() else { return }
            galleryPageControl.numberOfPages = count
            galleryCollectionView.reloadData()
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
        shadowView.addSubview(galleryCollectionView)
        shadowView.addSubview(galleryPageControl)
        shadowView.addSubview(name)
        shadowView.addSubview(price)
        addGestureRecognizer(tapTransition)
    }
    
    func setupStyle() {
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.makeShadow()
        
        galleryCollectionViewLayout.scrollDirection = .horizontal
        galleryCollectionViewLayout.minimumInteritemSpacing = 0
        galleryCollectionViewLayout.minimumLineSpacing = 0
        galleryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: galleryCollectionViewLayout)
        galleryCollectionView.register(NewProductGalleryCollectionViewCell.self, forCellWithReuseIdentifier: "newProductsGalleryCell")
        galleryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        galleryCollectionView.layer.cornerRadius = 10
        galleryCollectionView.showsHorizontalScrollIndicator = false
        galleryCollectionView.clipsToBounds = true
        galleryCollectionView.backgroundColor = .clear
        galleryCollectionView.dataSource = self
        galleryCollectionView.delegate = self
        galleryCollectionView.isPagingEnabled = true
        galleryCollectionView.bounces = false
        
        galleryPageControl.translatesAutoresizingMaskIntoConstraints = false
        galleryPageControl.activityItemsConfiguration = .none
        galleryPageControl.isUserInteractionEnabled = false
        galleryPageControl.numberOfPages = 5
        galleryPageControl.backgroundColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 0.2648230546)
        galleryPageControl.layer.cornerRadius = 15
        galleryPageControl.pageIndicatorTintColor = .systemGray5
        galleryPageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        galleryPageControl.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
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
        
        tapTransition.addTarget(self, action: #selector(tapTransitionTapped))
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            shadowView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -45),
            
            galleryCollectionView.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 0),
            galleryCollectionView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 0),
            galleryCollectionView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: 0),
            galleryCollectionView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: 0),
            
            galleryPageControl.bottomAnchor.constraint(equalTo: galleryCollectionView.bottomAnchor),
            galleryPageControl.centerXAnchor.constraint(equalTo: galleryCollectionView.centerXAnchor),
            
            name.topAnchor.constraint(equalTo: galleryCollectionView.bottomAnchor, constant: 5),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            
            price.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            price.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapTransitionTapped(sender: UITapGestureRecognizer) {
        showAnimation {

        }
    }
    
}

extension MainScreenNewProductsCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let galleryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "newProductsGalleryCell", for: indexPath) as! NewProductGalleryCollectionViewCell
        
        let cellViewModel = viewModel.galleryCellViewModel(for: indexPath)
        galleryCell.viewModel = cellViewModel
        
        return galleryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: galleryCollectionView.frame.width, height: galleryCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)

    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        galleryPageControl.currentPage = indexPath.item
    }
}
