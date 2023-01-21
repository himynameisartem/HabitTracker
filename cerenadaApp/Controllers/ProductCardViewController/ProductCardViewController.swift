//
//  ProductCardViewController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 30.11.2022.
//

import UIKit
import Kingfisher

class ProductCardViewController: UIViewController, UIScrollViewDelegate {
    
    let productCardClient = ProductCardClient()
    var id = Int()
    
    var tableViewHeight: NSLayoutConstraint!
    
    var cellsCounter = Int()
    var size = [String]()
    var price = String()
    
    var images = [Images]()
    
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
        return label
    }()
    
    let compoundLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Bold", size: 13)
        return label
    }()
    
    let compoundValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 13)
        label.textColor = .systemGray
        return label
    }()
    
    let colorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Bold", size: 13)
        return label
    }()
    
    let colorValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 13)
        label.textAlignment = .left
        label.textColor = .systemGray
        return label
    }()
    
    let sizeTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 10
        //        tableView.makeShadow()
        return tableView
    }()
    
    let discriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        return label
    }()
    
    let discriptionValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
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
        return cv
    }()
    
    
    
    //MARK: - ViewDidLoad
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        createScrollView()
        createGalleryCollectionView()
        createNameLabel()
        //        createVendorCodeLabel()
        createCompoundLabels()
        createColorLabels()
        createSizeTableView()
        discriptionLabels()
        createReviewsCollectionView()
        
    }
    
    override func viewWillLayoutSubviews() {
        tableViewHeight.constant = self.sizeTableView.contentSize.height
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
            galleryCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 1.5)
            
        ])
    }
    
    //MARK: Name Label
    
    func createNameLabel() {
        
        scrollView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: galleryCollectionView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //            nameLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 2)
            
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
        
        compoundLabel.text = ""
        compoundValue.text = ""

        scrollView.addSubview(compoundLabel)
        scrollView.addSubview(compoundValue)
        
        NSLayoutConstraint.activate([

            
            compoundLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            compoundLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            compoundLabel.widthAnchor.constraint(equalToConstant: 60),
            
            compoundValue.centerYAnchor.constraint(equalTo: compoundLabel.centerYAnchor),
            compoundValue.leadingAnchor.constraint(equalTo: compoundLabel.trailingAnchor),
            compoundValue.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    //MARK: Colors Labels
    
    func createColorLabels() {
        
        colorLabel.text = ""
        colorValue.text = ""
        
        colorValue.textAlignment = .left
        
        scrollView.addSubview(colorLabel)
        scrollView.addSubview(colorValue)
        
        NSLayoutConstraint.activate([
            
            colorLabel.topAnchor.constraint(equalTo: compoundLabel.bottomAnchor, constant: 5),
            colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            colorLabel.widthAnchor.constraint(equalToConstant: 37),
            
            colorValue.centerYAnchor.constraint(equalTo: colorLabel.centerYAnchor),
            colorValue.leadingAnchor.constraint(equalTo: colorLabel.trailingAnchor, constant: 10),
            colorValue.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    //MARK: Create Size Table View
    
    func createSizeTableView() {
        
        scrollView.addSubview(sizeTableView)
        
        
        NSLayoutConstraint.activate([
            
            sizeTableView.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 30),
            sizeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sizeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            //            sizeTableView.heightAnchor.constraint(equalToConstant: 300),
        ])
        tableViewHeight = sizeTableView.heightAnchor.constraint(equalToConstant: 10)
        
        view.addConstraint(tableViewHeight)
        
    }
    
    //MARK: Discription Labels
    
    func discriptionLabels() {
        
        discriptionLabel.text = "Описание: "
        discriptionValue.text = ""
        
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
        scrollView.addSubview(reviewsLabel)
        
        reviewsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        reviewsCollectionView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            
            reviewsLabel.topAnchor.constraint(equalTo: discriptionValue.bottomAnchor, constant: 20),
            reviewsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            reviewsCollectionView.topAnchor.constraint(equalTo: reviewsLabel.bottomAnchor, constant: 20),
            reviewsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reviewsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            reviewsCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            reviewsCollectionView.heightAnchor.constraint(equalToConstant: 180)
            
        ])
        
    }
    
}

//MARK: - Collection View Delegate


extension ProductCardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == galleryCollectionView {
            return images.count
        }
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == galleryCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "galleryCell", for: indexPath) as! GalleryCollectionViewCell
            
            DispatchQueue.main.async {
                cell.galleryImageView.kf.indicatorType = .activity
                cell.galleryImageView.kf.setImage(with: URL(string: self.images[indexPath.row].src.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? self.images[indexPath.row].src))
            }
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewCell", for: indexPath) as! ReviewsCollectionViewCell
        
        cell.shadowView.makeShadow()
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == galleryCollectionView {
            
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
            
        } else {
            
            return CGSize(width: view.frame.width / 1.2 , height: 180)
            
        }
        
    }
    
}

//MARK: - Table View Delegate

extension ProductCardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellsCounter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addToCardCell", for: indexPath) as! AddToCartTableViewCell
        
        cell.selectionStyle = .none
        cell.separatorInset = UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
        
        
        cell.sizeLabel.text = size[indexPath.row]
        cell.priceLabel.text = price + " ₽"
        
        DispatchQueue.main.async {
            cell.awakeFromNib()
            cell.addToCartButton.addTarget(self, action: #selector(self.addToCart), for: .touchUpInside)
            cell.addToCartButton.tag = indexPath.row
        }
        
        
        
        return cell
    }
    
    @objc func addToCart(sender: UIButton) {
        
        let index = sender.tag
        
        sender.showAnimation {
            print(String(self.id) + "  " + self.size[index] + "  " + self.price)
        }
    }
}

//MARK: - Product Card Manager Delegate -

extension ProductCardViewController: ProductCardManagerDelegate {
    func updateInterface(_: ProductCardClient, with data: ProductCardData) {
                
        DispatchQueue.main.async {
            
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

