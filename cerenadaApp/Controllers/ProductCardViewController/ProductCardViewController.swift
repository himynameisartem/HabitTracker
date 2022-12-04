//
//  ProductCardViewController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 30.11.2022.
//

import UIKit

class ProductCardViewController: UIViewController {
    
    let productCardClient = ProductCardClient()
    
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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    let vendorCodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    let compoundLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let compoundValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let colorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let colorValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
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
        return label
    }()
    
    let discriptionValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
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
        return cv
    }()
    
    
    
    //MARK: - ViewDidLoad
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        view.backgroundColor = .yellow
        scrollView.backgroundColor = .systemPink
        galleryCollectionView.backgroundColor = .blue
        
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        
        galleryCollectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: "galleryCell")
        
        createScrollView()
        createGalleryCollectionView()
        createNameLabel()
        createVendorCodeLabel()
        createCompoundLabels()
        createColorLabels()
        createSizeTableView()
        discriptionLabels()
        createReviewsCollectionView()
        
}
    
    
    //MARK: - Create Views
    
    //MARK: Scroll View
    
    func createScrollView() {
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
        
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: -92),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    //MARK: Gallery Collection View
    
    func createGalleryCollectionView() {
        
        scrollView.addSubview(galleryCollectionView)
        
        NSLayoutConstraint.activate([
        
            galleryCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            galleryCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 2.2)
            
        ])
    }
    
    //MARK: Name Label
    
    func createNameLabel() {
        
       
        nameLabel.text = "Test Name"
        
        scrollView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
        
            nameLabel.topAnchor.constraint(equalTo: galleryCollectionView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 2)
            
        ])
    }
    
    //MARK: Vendor Code Label
    
    func createVendorCodeLabel() {
        

        vendorCodeLabel.text = "Test Vendor"

        
        scrollView.addSubview(vendorCodeLabel)
        
        NSLayoutConstraint.activate([
        
            vendorCodeLabel.topAnchor.constraint(equalTo: galleryCollectionView.bottomAnchor, constant: 10),
            vendorCodeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            vendorCodeLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 2)
            
        ])
    }

    //MARK: Compound Labels
    
    func createCompoundLabels() {

        compoundLabel.text = "Test: "
        compoundValue.text = "Compound Test"
        
        scrollView.addSubview(compoundLabel)
        scrollView.addSubview(compoundValue)
        
        NSLayoutConstraint.activate([
        
            compoundLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            compoundLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            compoundValue.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            compoundValue.leadingAnchor.constraint(equalTo: compoundLabel.trailingAnchor)
        ])
    }
    
    //MARK: Colors Labels
    
    func createColorLabels() {

        colorLabel.text = "Test: "
        colorValue.text = "Color Test"
        
        scrollView.addSubview(colorLabel)
        scrollView.addSubview(colorValue)
        
        NSLayoutConstraint.activate([
        
            colorLabel.topAnchor.constraint(equalTo: compoundLabel.bottomAnchor),
            colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            colorValue.topAnchor.constraint(equalTo: compoundLabel.bottomAnchor),
            colorValue.leadingAnchor.constraint(equalTo: colorLabel.trailingAnchor)
        ])
    }
    
    //MARK: Create Size Table View
    
    func createSizeTableView() {
        
        scrollView.addSubview(sizeTableView)
        
        NSLayoutConstraint.activate([
       
            sizeTableView.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 20),
            sizeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sizeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sizeTableView.heightAnchor.constraint(equalToConstant: 300),
        ])
        
    }
    
    //MARK: Discription Labels
    
    func discriptionLabels() {
        
        discriptionLabel.text = "Discription: "
        discriptionValue.text = "   Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! Discripton Test! "
        
        scrollView.addSubview(discriptionLabel)
        scrollView.addSubview(discriptionValue)
        
        NSLayoutConstraint.activate([
        
            discriptionLabel.topAnchor.constraint(equalTo: sizeTableView.bottomAnchor, constant: 20),
            discriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            discriptionValue.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: 5),
            discriptionValue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            discriptionValue.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
        ])
    }
    
    //MARK: Reviews Collection View
    
    func createReviewsCollectionView() {
        
        scrollView.addSubview(reviewsCollectionView)
        
        reviewsCollectionView.backgroundColor = .purple
        
        NSLayoutConstraint.activate([
        
            reviewsCollectionView.topAnchor.constraint(equalTo: discriptionValue.bottomAnchor, constant: 20),
            reviewsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reviewsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            reviewsCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            reviewsCollectionView.heightAnchor.constraint(equalToConstant: 180)
            
        ])
        
    }
    
}


extension ProductCardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "galleryCell", for: indexPath) as! GalleryCollectionViewCell
        
        
        cell.galleryImageView.image = UIImage(named: "ozon")
        
        return cell
    }
}
