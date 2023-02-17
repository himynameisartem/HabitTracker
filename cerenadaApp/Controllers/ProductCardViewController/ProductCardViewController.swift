//
//  ProductCardViewController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 30.11.2022.
//

import UIKit
import Kingfisher

class ProductCardViewController: UIViewController, UIScrollViewDelegate {
    
    var ids = [Int]()
    var related = [ProductCardData]()
    
    var productCounter = String()
    var discription = String()
    
    let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    
    let productCardClient = ProductCardClient()
    let reviewClient = ReviewClient()
    let relatedClient = RelatedClient()
    
    var reviews = [ReviewsData]()
    var id = Int()
    var tableViewHeight: NSLayoutConstraint!
    var cellsCounter = Int()
    var size = [String]()
    var price = String()
    var images = [Images]()
    var item = 0
    
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
    
    let sharedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let sharedImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "square.and.arrow.up")
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
        cv.isPagingEnabled = true
        return cv
    }()
    
    let galleryPageControl: UIPageControl = {
        let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.activityItemsConfiguration = .none
        page.isUserInteractionEnabled = false
        page.pageIndicatorTintColor = .systemGray5
        page.currentPageIndicatorTintColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        return page
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let nextButtonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = .systemGray2
        return image
    }()
    
    let previousButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let previousButtonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "chevron.left")
        image.tintColor = .systemGray2
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let vendorCodeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 2
        view.layer.borderColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        return view
    }()
    
    let vendorCodeTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "АРТИКУЛ"
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-bold", size: 10)
        label.textColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        return label
    }()
    
    let vendorCodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = ""
        label.textColor = #colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)
        label.font = UIFont(name: "Helvetica-bold", size: 18)
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
        label.numberOfLines = 0
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
        label.numberOfLines = 0
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
    
    let addReviewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("НАПИСАТЬ ОТЗЫВ", for: .normal)
        button.layer.cornerRadius = 5
        button.setTitleColor( #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1) , for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        button.titleLabel?.font = UIFont(name: "helvetica-Bold", size: 14)
        return button
    }()
    
    let relatedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        label.text = "Похожие товары: "
        return label
    }()
    
    let relatedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let tapOnDisplay = UITapGestureRecognizer()
    
    //MARK: - ViewDidLoad
    
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
                
        tapOnDisplay.cancelsTouchesInView = false
        
        navigationView.alpha = 0
        backButton.tintColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        
        scrollView.delegate = self
        productCardClient.delegate = self
        productCardClient.request(id: id)
        
        reviewClient.delegate = self
        reviewClient.request(productId: 328353)
        
        relatedClient.delegate = self
        for i in ids {
            relatedClient.request(id: i)
        }
        
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
        
        relatedCollectionView.delegate = self
        relatedCollectionView.dataSource = self
        relatedCollectionView.register(RelatedCollectionViewCell.self, forCellWithReuseIdentifier: "relatedCell")

        addViews()
        createNavigationView()
        addBackButton()
        setupConstraints()
        
        likeButton.addTarget(self, action: #selector(likeTapped), for: .touchUpInside)
        sharedButton.addTarget(self, action: #selector(sharedTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        previousButton.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)
        addReviewButton.addTarget(self, action: #selector(addReviewTapped), for: .touchUpInside)
        
        tapOnDisplay.addTarget(self, action: #selector(tapGesture))
    }
    
    override func viewWillLayoutSubviews() {
        tableViewHeight.constant = self.sizeTableView.contentSize.height
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
    //MARK: - Create Views
    
    func addViews() {
                
        view.addGestureRecognizer(tapOnDisplay)
        view.addSubview(scrollView)
        scrollView.addSubview(galleryCollectionView)
        scrollView.addSubview(nextButton)
        nextButton.addSubview(nextButtonImage)
        scrollView.addSubview(previousButton)
        previousButton.addSubview(previousButtonImage)
        scrollView.addSubview(galleryPageControl)
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(vendorCodeView)
        vendorCodeView.addSubview(vendorCodeTitle)
        scrollView.addSubview(vendorCodeLabel)
        scrollView.addSubview(compoundLabel)
        scrollView.addSubview(compoundValue)
        scrollView.addSubview(colorLabel)
        scrollView.addSubview(colorValue)
        scrollView.addSubview(sizeTableView)
        scrollView.addSubview(discriptionLabel)
        scrollView.addSubview(discriptionValue)
        scrollView.addSubview(reviewsLabel)
        scrollView.addSubview(reviewsCollectionView)
        scrollView.addSubview(addReviewButton)
        scrollView.addSubview(relatedLabel)
        scrollView.addSubview(relatedCollectionView)
    }
    
    func setupConstraints() {
        
        if discription.isEmpty {
            discriptionLabel.isHidden = true
            discriptionValue.isHidden = true
        }
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            galleryCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            galleryCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width * 1.44),
            
            nextButton.centerYAnchor.constraint(equalTo: galleryCollectionView.centerYAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.widthAnchor.constraint(equalToConstant: 20),
            
            nextButtonImage.centerYAnchor.constraint(equalTo: galleryCollectionView.centerYAnchor),
            nextButtonImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButtonImage.heightAnchor.constraint(equalToConstant: 40),
            nextButtonImage.widthAnchor.constraint(equalToConstant: 20),
            
            previousButton.centerYAnchor.constraint(equalTo: galleryCollectionView.centerYAnchor),
            previousButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            previousButton.heightAnchor.constraint(equalToConstant: 40),
            previousButton.widthAnchor.constraint(equalToConstant: 20),
            
            previousButtonImage.centerYAnchor.constraint(equalTo: galleryCollectionView.centerYAnchor),
            previousButtonImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            previousButtonImage.heightAnchor.constraint(equalToConstant: 40),
            previousButtonImage.widthAnchor.constraint(equalToConstant: 20),
            
            galleryPageControl.leadingAnchor.constraint(equalTo: galleryCollectionView.leadingAnchor),
            galleryPageControl.trailingAnchor.constraint(equalTo: galleryCollectionView.trailingAnchor),
            galleryPageControl.bottomAnchor.constraint(equalTo: galleryCollectionView.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: galleryCollectionView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            vendorCodeView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            vendorCodeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            vendorCodeView.widthAnchor.constraint(equalToConstant: 70),
            vendorCodeView.heightAnchor.constraint(equalToConstant: 40),
            
            vendorCodeTitle.topAnchor.constraint(equalTo: vendorCodeView.topAnchor, constant: 3),
            vendorCodeTitle.leadingAnchor.constraint(equalTo: vendorCodeView.leadingAnchor),
            vendorCodeTitle.trailingAnchor.constraint(equalTo: vendorCodeView.trailingAnchor),
            
            vendorCodeLabel.bottomAnchor.constraint(equalTo: vendorCodeView.bottomAnchor, constant: -3),
            vendorCodeLabel.leadingAnchor.constraint(equalTo: vendorCodeView.leadingAnchor),
            vendorCodeLabel.trailingAnchor.constraint(equalTo: vendorCodeView.trailingAnchor),
            
            compoundLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            compoundLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            compoundLabel.widthAnchor.constraint(equalToConstant: 60),
            
            compoundValue.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            compoundValue.leadingAnchor.constraint(equalTo: compoundLabel.trailingAnchor, constant: -5),
            compoundValue.trailingAnchor.constraint(lessThanOrEqualTo: vendorCodeView.leadingAnchor, constant: -10),
            
            colorLabel.topAnchor.constraint(equalTo: compoundValue.bottomAnchor, constant: 5),
            colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            colorValue.centerYAnchor.constraint(equalTo: colorLabel.centerYAnchor),
            colorValue.leadingAnchor.constraint(equalTo: colorLabel.trailingAnchor, constant: 5),
            colorValue.trailingAnchor.constraint(lessThanOrEqualTo: vendorCodeView.leadingAnchor, constant: -10),
            
            sizeTableView.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 30),
            sizeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sizeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            discriptionLabel.topAnchor.constraint(equalTo: sizeTableView.bottomAnchor, constant: 20),
            discriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            discriptionValue.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: 5),
            discriptionValue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            discriptionValue.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            reviewsLabel.topAnchor.constraint(equalTo: discription.isEmpty ? sizeTableView.bottomAnchor : discriptionValue.bottomAnchor, constant: 20),
            reviewsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            reviewsCollectionView.topAnchor.constraint(equalTo: reviewsLabel.bottomAnchor, constant: 5),
            reviewsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reviewsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            reviewsCollectionView.heightAnchor.constraint(equalToConstant: 180),
            
            addReviewButton.topAnchor.constraint(equalTo: reviewsCollectionView.bottomAnchor, constant: 5),
            addReviewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addReviewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addReviewButton.heightAnchor.constraint(equalToConstant: 40),
            
            relatedLabel.topAnchor.constraint(equalTo: addReviewButton.bottomAnchor, constant: 15),
            relatedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            relatedCollectionView.topAnchor.constraint(equalTo: relatedLabel.bottomAnchor, constant: 5),
            relatedCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            relatedCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            relatedCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            relatedCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 1.625)
            
        ])
        
        tableViewHeight = sizeTableView.heightAnchor.constraint(equalToConstant: 10)
        view.addConstraint(tableViewHeight)
        
    }
    
//MARK: - End Editing
    
    @objc func tapGesture() {
        view.endEditing(true)
    }
    
//MARK: - Add Review Button Target
    
    @objc func addReviewTapped(_ sender: UIButton) {
        
        sender.showAnimation {
            print("add review")
        }
    }
    
//MARK: - Like & Share Buttons Target
    
    @objc func likeTapped(_ sender: UIButton) {

        sender.showAnimation {
            
            print("like")
        }
    }
    
    @objc func sharedTapped(_ sender: UIButton) {
    
        sender.showAnimation {
            print("shared")
        }
    }
    
}






//MARK: - Product Card Manager Delegate -

extension ProductCardViewController: ProductCardManagerDelegate {
    func updateInterface(_: ProductCardClient, with data: ProductCardData) {
        
        DispatchQueue.main.async {

            self.images = data.images
            self.galleryPageControl.numberOfPages = data.images.count
            self.navigationTitle.text = data.name
            self.nameLabel.text = data.name
            for i in data.sku {
                if i != "/" {
                    self.vendorCodeLabel.text?.append(i)
                } else {
                    break
                }
            }
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

//MARK: - Review Delegate

extension ProductCardViewController: ReviewsManagerDelegate {
    func update(_: ReviewClient, with data: [ReviewsData]) {
        
        DispatchQueue.main.async {
            self.reviews = data
            self.reviewsCollectionView.reloadData()
        }
        
    }

}

//MARK: Related Delegate

extension ProductCardViewController: RelatedClientDelegate {
    func updateInterface(_: RelatedClient, with data: ProductCardData) {
        
        if data.status == "publish" {
            self.related.append(data)
        }
        self.relatedCollectionView.reloadData()
    }
}

//MARK: - Scroll Button Target

extension ProductCardViewController {
    
    @objc func nextButtonTapped() {
        
        animatedScrollButton(button: nextButtonImage)
            if self.item + 1 < self.images.count {
                self.item += 1
            }
            let indexPath = IndexPath(item: self.item, section: 0)
            self.galleryCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)

    }
    
    @objc func previousButtonTapped() {
    
        animatedScrollButton(button: previousButtonImage)
        
        if self.item + 1 > 1 {
            self.item -= 1
        }
        let indexPath = IndexPath(item: self.item, section: 0)
        self.galleryCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        
    }
}

//MARK: -  Animated Scroll Button

extension ProductCardViewController {
    
    func animatedScrollButton(button: UIView) {
        UIView.animate(withDuration: 0, delay: 0) {
            button.tintColor = .black
        } completion: { done in
            if done{
                UIView.animate(withDuration: 0.2, delay: 0) {
                    button.tintColor = .systemGray2
                }
            }
        }
    }
}


