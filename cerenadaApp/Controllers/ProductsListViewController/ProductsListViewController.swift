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
    var categoryDelegate: SelectCategoriesViewCellProtocol?
    var topCategoryCollectionViewConstraint = NSLayoutConstraint()
    var currentScale : CGFloat = 6.0
    let productListClient = NetworkClient()
    var selectedLikeImage = "heart"
    
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
    
    let categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    let productCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.contentInset = UIEdgeInsets(top: 10, left: 5, bottom: 0, right: 5)
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
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: "categoriesCell")
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "productCell")
        
        addViews()
        setupConstraints()
        createNavigationView()
        addBackButton()
        
        view.backgroundColor = .systemGray6
            
    }
    
    //MARK: - Create Views
    
    func addViews() {
        
        view.addSubview(productCollectionView)
        if !categories.isEmpty {
            view.addSubview(categoriesCollectionView)
        }
    }
    
    func setupConstraints() {
        
        guard let top = window?.safeAreaInsets.top else { return }
        let heightNavigationView = 96 - (top < 21 ? top : 0)
        
        if !categories.isEmpty {
            topCategoryCollectionViewConstraint = NSLayoutConstraint(item: categoriesCollectionView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: heightNavigationView)
            
            view.addConstraint(topCategoryCollectionViewConstraint)
            
            NSLayoutConstraint.activate([
                categoriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                categoriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                categoriesCollectionView.heightAnchor.constraint(equalToConstant: 50),
            ])
            
            productCollectionView.contentInset = UIEdgeInsets(top: 45, left: 5, bottom: 0, right: 5)
            
        }
        
        
        NSLayoutConstraint.activate([

            productCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: heightNavigationView),
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
