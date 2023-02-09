//
//  ProductCardViewController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 30.11.2022.
//

import UIKit
import Kingfisher

class ProductCardViewController: UIViewController, UIScrollViewDelegate {
    
    let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    let productCardClient = ProductCardClient()
    var id = Int()
    var tableViewHeight: NSLayoutConstraint!
    var cellsCounter = Int()
    var size = [String]()
    var price = String()
    var images = [Images]()
    
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
        button.tintColor = .black
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
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let galleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let vendorCodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.text = ""
        return label
    }()
    
    let compoundLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Bold", size: 13)
        label.text = ""
        return label
    }()
    
    let compoundValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 13)
        label.text = ""
        label.textColor = .systemGray
        return label
    }()
    
    let colorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Bold", size: 13)
        label.text = ""
        return label
    }()
    
    let colorValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 13)
        label.textAlignment = .left
        label.text = ""
        label.textColor = .systemGray
        return label
    }()
    
    let sizeTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 10
        return tableView
    }()
    
    let discriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        label.text = "Описание: "
        return label
    }()
    
    let discriptionValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = ""
        return label
    }()
    
    let reviewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        label.text = "Отзывы: "
        return label
    }()
    
    let reviewsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        cv.backgroundColor = .clear
        return cv
    }()
    
    //MARK: - ViewDidLoad
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationView.alpha = 0
        backButton.tintColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        
        scrollView.delegate = self
        productCardClient.delegate = self
        productCardClient.request(id: id)
        
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .systemGray6
        
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        galleryCollectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: "galleryCell")
        
        sizeTableView.delegate = self
        sizeTableView.dataSource = self
        sizeTableView.register(AddToCartTableViewCell.self, forCellReuseIdentifier: "addToCardCell")
        
        reviewsCollectionView.delegate = self
        reviewsCollectionView.dataSource = self
        reviewsCollectionView.register(ReviewsCollectionViewCell.self, forCellWithReuseIdentifier: "reviewCell")
        
        addViews()
        createNavigationView()
        addBackButton()
        setupConstraints()
        
    }
    
    override func viewWillLayoutSubviews() {
        tableViewHeight.constant = self.sizeTableView.contentSize.height
    }
    
    //MARK: - Create Views
    
    func addViews() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(galleryCollectionView)
        scrollView.addSubview(nameLabel)
        //        scrollView.addSubview(vendorCodeLabel)
        scrollView.addSubview(compoundLabel)
        scrollView.addSubview(compoundValue)
        scrollView.addSubview(colorLabel)
        scrollView.addSubview(colorValue)
        scrollView.addSubview(sizeTableView)
        scrollView.addSubview(discriptionLabel)
        scrollView.addSubview(discriptionValue)
        scrollView.addSubview(reviewsCollectionView)
        scrollView.addSubview(reviewsLabel)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            galleryCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            galleryCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width * 1.44),
            
            nameLabel.topAnchor.constraint(equalTo: galleryCollectionView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //            vendorCodeLabel.topAnchor.constraint(equalTo: galleryCollectionView.bottomAnchor, constant: 10),
            //            vendorCodeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            //            vendorCodeLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            
            compoundLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            compoundLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            compoundLabel.widthAnchor.constraint(equalToConstant: 60),
            
            compoundValue.centerYAnchor.constraint(equalTo: compoundLabel.centerYAnchor),
            compoundValue.leadingAnchor.constraint(equalTo: compoundLabel.trailingAnchor),
            compoundValue.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            colorLabel.topAnchor.constraint(equalTo: compoundLabel.bottomAnchor, constant: 5),
            colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            colorLabel.widthAnchor.constraint(equalToConstant: 37),
            
            colorValue.centerYAnchor.constraint(equalTo: colorLabel.centerYAnchor),
            colorValue.leadingAnchor.constraint(equalTo: colorLabel.trailingAnchor, constant: 10),
            colorValue.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            sizeTableView.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 30),
            sizeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sizeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            discriptionLabel.topAnchor.constraint(equalTo: sizeTableView.bottomAnchor, constant: 20),
            discriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            discriptionValue.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: 5),
            discriptionValue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            discriptionValue.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            reviewsLabel.topAnchor.constraint(equalTo: discriptionValue.bottomAnchor, constant: 20),
            reviewsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            reviewsCollectionView.topAnchor.constraint(equalTo: reviewsLabel.bottomAnchor, constant: 20),
            reviewsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reviewsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            reviewsCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            reviewsCollectionView.heightAnchor.constraint(equalToConstant: 180),
            
        ])
        
        tableViewHeight = sizeTableView.heightAnchor.constraint(equalToConstant: 10)
        view.addConstraint(tableViewHeight)
        
    }
}

//MARK: - Product Card Manager Delegate -

extension ProductCardViewController: ProductCardManagerDelegate {
    func updateInterface(_: ProductCardClient, with data: ProductCardData) {
        
        DispatchQueue.main.async {
            
            self.navigationTitle.text = data.name
            self.nameLabel.text = data.name
            self.images = data.images
            self.discriptionValue.text = "   " + String(data.description.dropFirst(3).dropLast(5))
            self.galleryCollectionView.reloadData()
            
            self.cellsCounter = data.attributes[0].options.count
            self.size = data.attributes[0].options
            self.sizeTableView.reloadData()
            
            for i in data.meta_data {
                
                if i.key == "adv_color" {
                    self.colorLabel.text = "Цвет" + ":" + " "
                    
                    if let color = i.value?.stringValue {
                        self.colorValue.text = color
                    }
                }
                
                if i.key == "adv_sostav" {
                    self.compoundLabel.text = "Состав" + ":" + " "
                    if let compound = i.value?.stringValue {
                        self.compoundValue.text = compound
                    }
                }
                
                if i.key == "adv_sp" {
                    if let price = i.value?.stringValue {
                        self.price = price
                    }
                }
            }
        }
    }
}

