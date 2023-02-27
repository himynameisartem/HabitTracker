//
//  ProductsListViewController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 11.02.2023.
//

import UIKit
import Kingfisher

class ProductsListViewController: UIViewController {
    
    let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    var categoryID = Int()
    var categoryName = String()
    var productList = [ProductCardData]()
    
    let productListClient = NetworkClient()
    
    let coloredSafeArea: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        return view
    }()
    
    let backImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "chevron.backward.circle.fill")
        return image
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let likeImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "heart")
        return image
    }()
    
    let navigationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        return view
    }()
    
    let navigationTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    let productCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        cv.backgroundColor = .clear
        return cv
    }()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productListClient.delegate = self
        productListClient.request(category: categoryID)
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "productCell")
        
        createNavigationView()
        addBackButton()
        addViews()
        setupConstraints()
        
        view.backgroundColor = .systemGray6
        
        print(view.frame.height)
        
    }
    
    //MARK: - Create Views
    
    func addViews() {
        
        view.addSubview(productCollectionView)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            productCollectionView.topAnchor.constraint(equalTo: navigationView.bottomAnchor),
            productCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProductsListViewController: NewProductManagerDelegate {
    func updateInterface(_: NetworkClient, with data: [ProductCardData]) {
        
        self.productList = data
        self.productCollectionView.reloadData()
        
    }
}

extension ProductsListViewController {
    
     func fontSizeForNameLabel(viewHeight: CGFloat) -> CGFloat {
        var size = CGFloat()
        
        if viewHeight == 568.0 {
            size = 11
        } else {
            size = 14
        }
        return size
    }
    
    func fontSizeForPriceLabel(viewHeight: CGFloat) -> CGFloat {
       var size = CGFloat()
       
       if viewHeight == 568.0 {
           size = 12
       } else {
           size = 14
       }
       return size
   }
}
