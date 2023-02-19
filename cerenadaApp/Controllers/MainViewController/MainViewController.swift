//
//  MainTableViewController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 06.04.2022.
//

import UIKit
import Kingfisher
import MessageUI

class MainViewController: UIViewController{
    
    let networkClient = NetworkClient()
    var data = [ProductCardData]()
    let searchController = UISearchController(searchResultsController: nil)
    let alert = InformationAbousUsViewController()
    
    var timer = Timer()
    var counter = 0
    var price = [String]()
    let navBar = UINavigationBar()
    
    let navLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let infoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "info"), for: .normal)
        button.alpha = 0.5
        return button
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let shadowViewForPresentation: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.makeShadow()
        return view
    }()
    
    var presentationCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.layer.cornerRadius = 10
        cv.isUserInteractionEnabled = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.makeShadow()
        return cv
    }()
    
    let presentationPageView: UIPageControl = {
        let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.currentPage = 0
        page.numberOfPages = previewArray.count
        page.activityItemsConfiguration = .none
        page.isUserInteractionEnabled = false
        page.pageIndicatorTintColor = .systemGray5
        page.currentPageIndicatorTintColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        return page
    }()
    
    let newProductsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "НОВИНКИ"
        label.font = UIFont(name: "helvetica-bold", size: 24)
        label.textColor = .systemGray
        return label
    }()
    
    var newProductCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let partnersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "НАШИ ПАРТНЕРЫ"
        label.font = UIFont(name: "helvetica-bold", size: 24)
        label.textColor = .systemGray
        return label
    }()
    
    var partnersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 50, right: 20)
        cv.layer.cornerRadius = 10
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.makeShadow()
        return cv
    }()
    
    let infoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    //MARK: - viewDidLoad
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        networkClient.delegate = self
        networkClient.request()
        
        presentationCollectionView.delegate = self
        presentationCollectionView.dataSource = self
        presentationCollectionView.register(PresentationCollectionViewCell.self, forCellWithReuseIdentifier: "presentationCell")
        
        newProductCollectionView.delegate = self
        newProductCollectionView.dataSource = self
        newProductCollectionView.register(NewProductsCollectionViewCell.self, forCellWithReuseIdentifier: "newProductCell")
        
        newProductCollectionView.register(NextButtonCollectionViewCell.self, forCellWithReuseIdentifier: "nextButton")
        
        partnersCollectionView.delegate = self
        partnersCollectionView.dataSource = self
        partnersCollectionView.register(PartnersCollectionViewCell.self, forCellWithReuseIdentifier: "partnersCell")
        
        infoTableView.delegate = self
        infoTableView.dataSource = self
        infoTableView.register(InfoTableViewCell.self, forCellReuseIdentifier: "infoCell")
        infoTableView.register(SizeContainerTableViewCell.self, forCellReuseIdentifier: "sizeContainerCell")
        infoTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "contactCell")
        infoTableView.rowHeight = UITableView.automaticDimension
        infoTableView.separatorStyle = .none
        
        view.backgroundColor = .systemGray6
        
        createNavigationView()
        createSearchBar()
        createTimer()
        addViews()
        setupConstraints()
                
    }
    
    //MARK: - Create Views
    
    func addViews() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(shadowViewForPresentation)
        shadowViewForPresentation.addSubview(presentationCollectionView)
        scrollView.addSubview(presentationPageView)
        scrollView.addSubview(newProductsLabel)
        scrollView.addSubview(newProductCollectionView)
        scrollView.addSubview(partnersLabel)
        scrollView.addSubview(partnersCollectionView)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: navBar.frame.height + searchController.searchBar.frame.height),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            shadowViewForPresentation.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 10),
            shadowViewForPresentation.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 20),
            shadowViewForPresentation.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            shadowViewForPresentation.heightAnchor.constraint(equalToConstant: view.frame.width / 1.625),
            
            presentationCollectionView.topAnchor.constraint(equalTo: shadowViewForPresentation.topAnchor),
            presentationCollectionView.leadingAnchor.constraint(equalTo: shadowViewForPresentation.leadingAnchor),
            presentationCollectionView.trailingAnchor.constraint(equalTo: shadowViewForPresentation.trailingAnchor),
            presentationCollectionView.bottomAnchor.constraint(equalTo: shadowViewForPresentation.bottomAnchor),
            
            presentationPageView.leadingAnchor.constraint(equalTo: presentationCollectionView.leadingAnchor),
            presentationPageView.trailingAnchor.constraint(equalTo: presentationCollectionView.trailingAnchor),
            presentationPageView.bottomAnchor.constraint(equalTo: presentationCollectionView.bottomAnchor),
            
            newProductsLabel.topAnchor.constraint(equalTo: presentationCollectionView.bottomAnchor, constant: 20),
            newProductsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            newProductCollectionView.topAnchor.constraint(equalTo: newProductsLabel.bottomAnchor,constant: 10),
            newProductCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newProductCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newProductCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 1.625),
            
            partnersLabel.topAnchor.constraint(equalTo: newProductCollectionView.bottomAnchor, constant: 20),
            partnersLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            partnersCollectionView.topAnchor.constraint(equalTo: partnersLabel.bottomAnchor,constant: 0),
            partnersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            partnersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            partnersCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            partnersCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 1.34)
            
        ])
    }
    
    //MARK: - InfoButton Tapped
    
    @objc func infoTapped(sender: UIButton) {
        
        alert.showInformationVC(viewController: self, searchController: searchController, tableView: infoTableView, infoButton: infoButton)
        
    }
    
    //MARK: - See More Button Tapped
    
    @objc func seeMoreButtonTapped(sender: UIButton) {
        
        let vc = ProductsListViewController()
        sender.showAnimation {

            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
    //MARK: - Timer + Change Image in PresentationCollectionView
    
    func createTimer() {
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }
    
    @objc func changeImage() {
        
        if counter < previewArray.count {
            if counter == 0 {
                counter = 1
            }
            let index = IndexPath.init(item: counter, section: 0)
            self.presentationCollectionView.scrollToItem(at: index,
                                                         at: .centeredHorizontally,
                                                         animated: true)
            presentationPageView.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.presentationCollectionView.scrollToItem(at: index,
                                                         at: .centeredHorizontally,
                                                         animated: true)
            presentationPageView.currentPage = counter
            counter = 1
        }
    }
}

//MARK: Mail Delegate

extension MainViewController: MFMailComposeViewControllerDelegate {
    
    func configurateMailComposer() -> MFMailComposeViewController {
        
        let mailComposeVC = MFMailComposeViewController()
        
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients(["ivrosinvest@mail.ru"])
        mailComposeVC.setSubject("")
        
        return mailComposeVC
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

//MARK: - New Products Delegate -

extension MainViewController: NewProductManagerDelegate {
    func updateInterface(_: NetworkClient, with data: [ProductCardData]) {
        self.data = data
        
        for i in self.data {
            for j in i.meta_data {
                if j.key == "adv_sp" {
                    price.append(j.value?.stringValue! ?? "")
                }
            }
        }
        
        newProductCollectionView.reloadData()
    }
}
