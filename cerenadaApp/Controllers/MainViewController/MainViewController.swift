//
//  MainTableViewController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 06.04.2022.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController{
        
    let networkClient = NetworkClient()
    var data = [ProductCardData]()
    let searchController = UISearchController(searchResultsController: nil)
    
    let alert = AlertView()
    
    var timer = Timer()
    var counter = 0
    
    var price = [String]()
    
    let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
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
        cv.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        cv.backgroundColor = .clear
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
        createSeparatorView()
        createScrollView()
        createPresentationCollectionView()
        createPageView()
        createTimer()
        createNewProductsLabel()
        createNewProductCollectionView()
        createPartnersLabel()
        createPartnersCollectionView()
        
    }
    
    //MARK: - Create Views
    
    //MARK: Navigation View
    
    func createNavigationView() {
        let navView = UIView()
        
        navView.translatesAutoresizingMaskIntoConstraints = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
            button.addTarget(self, action: #selector(infoTapped), for: .touchUpInside)
            return button
        }()

        navView.addSubview(infoButton)
        
        let navBar = UINavigationBar()
        navBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 140)
        view.addSubview(navBar)
        navBar.addSubview(navLogo)
        
        NSLayoutConstraint.activate([
            
            
            navLogo.centerXAnchor.constraint(equalTo: navBar.centerXAnchor),
            navLogo.topAnchor.constraint(equalTo: navBar.topAnchor, constant: 40),
            navLogo.heightAnchor.constraint(equalToConstant: 80),
            navLogo.widthAnchor.constraint(equalToConstant: 160),

            navView.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            navView.heightAnchor.constraint(equalToConstant: 44),

            infoButton.bottomAnchor.constraint(equalTo: navView.bottomAnchor),
            infoButton.trailingAnchor.constraint(equalTo: navView.trailingAnchor),
            infoButton.widthAnchor.constraint(equalToConstant: 40),
            infoButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        navigationItem.titleView = navView
    }
    
    @objc func infoTapped(sender: UIButton) {
     
        alert.showAlert(viewController: self, searchController: searchController, separator: separatorView, tableView: infoTableView)
            separatorView.isHidden = true
        
    }
    
    //MARK: Labels
    
    func createNewProductsLabel() {
        scrollView.addSubview(newProductsLabel)
        
        
        NSLayoutConstraint.activate([
        
            newProductsLabel.topAnchor.constraint(equalTo: presentationCollectionView.bottomAnchor, constant: 20),
            newProductsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    func createPartnersLabel() {
        scrollView.addSubview(partnersLabel)
        
        NSLayoutConstraint.activate([

            partnersLabel.topAnchor.constraint(equalTo: newProductCollectionView.bottomAnchor, constant: 20),
            partnersLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    
    //MARK: Search Bar
    
    func createSearchBar() {
        
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.layer.borderColor = UIColor.white.cgColor
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.navigationController?.hidesBarsOnSwipe = false
        searchController.searchBar.sizeToFit()
        
        navigationItem.searchController = searchController

    }
    
    //MARK: Separator
    
    func createSeparatorView() {
        
        view.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
        
            separatorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 0)
        ])
        
    }
    
    //MARK: Scroll View
    
    func createScrollView() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    //MARK: Presentation Collection View
    
    func createPresentationCollectionView() {
        
        let shadowViewForPresentation: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.makeShadow()
            return view
        }()
        
        scrollView.addSubview(shadowViewForPresentation)
        
        shadowViewForPresentation.addSubview(presentationCollectionView)
        presentationCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            shadowViewForPresentation.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 10),
            shadowViewForPresentation.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 20),
            shadowViewForPresentation.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            shadowViewForPresentation.heightAnchor.constraint(equalToConstant: 240),
            
            presentationCollectionView.topAnchor.constraint(equalTo: shadowViewForPresentation.topAnchor),
            presentationCollectionView.leadingAnchor.constraint(equalTo: shadowViewForPresentation.leadingAnchor),
            presentationCollectionView.trailingAnchor.constraint(equalTo: shadowViewForPresentation.trailingAnchor),
            presentationCollectionView.bottomAnchor.constraint(equalTo: shadowViewForPresentation.bottomAnchor)
            
        ])
        
    }
    
        //MARK: Page View
    
    func createPageView() {
        
        scrollView.addSubview(presentationPageView)
        
        NSLayoutConstraint.activate([
        
            presentationPageView.leadingAnchor.constraint(equalTo: presentationCollectionView.leadingAnchor),
            presentationPageView.trailingAnchor.constraint(equalTo: presentationCollectionView.trailingAnchor),
            presentationPageView.bottomAnchor.constraint(equalTo: presentationCollectionView.bottomAnchor),
        ])
    }
    
    //MARK: New Product Collection View
    
    func createNewProductCollectionView() {
        
        scrollView.addSubview(newProductCollectionView)
        newProductCollectionView.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
        
            newProductCollectionView.topAnchor.constraint(equalTo: newProductsLabel.bottomAnchor,constant: 10),
            newProductCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newProductCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newProductCollectionView.heightAnchor.constraint(equalToConstant: 240)
            
        ])
        
    }
    
    //MARK: Partners Collection View
    
    func createPartnersCollectionView() {
        
        scrollView.addSubview(partnersCollectionView)
        partnersCollectionView.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
        
            partnersCollectionView.topAnchor.constraint(equalTo: partnersLabel.bottomAnchor,constant: 0),
            partnersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            partnersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            partnersCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            partnersCollectionView.heightAnchor.constraint(equalToConstant: 290)
            
        ])
        
    }
    
    //MARK: - Timer
    
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



//MARK: - Update Search Results -

extension MainViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
       
    }
}

//MARK: - Collection View Delegate -

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == presentationCollectionView {
            return previewArray.count
        } else if collectionView == newProductCollectionView {
            if data.count < 10 {
                return data.count
            } else {
                return 10
            }
        } else {
            return 4
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == presentationCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "presentationCell", for: indexPath) as! PresentationCollectionViewCell
            
            cell.previewImageView.image = UIImage(named: previewArray[indexPath.row])
            
            return cell
        } else if collectionView == newProductCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newProductCell", for: indexPath) as! NewProductsCollectionViewCell
            
            DispatchQueue.main.async {

                cell.productImageView.kf.indicatorType = .activity
                cell.productImageView.kf.setImage(with: URL(string: self.data[indexPath.row].images[0].src.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? self.data[indexPath.row].images[0].src))
            }
            
            cell.productName.text = data[indexPath.row].name
            cell.productPrice.text = price[indexPath.row] + " ₽"

            
            return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "partnersCell", for: indexPath) as! PartnersCollectionViewCell
            
            cell.partnersImageView.image = UIImage(named: partnersArray[indexPath.row])
            
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == presentationCollectionView {
            
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
            
        } else if collectionView == newProductCollectionView {
            
            return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)

        } else {
            
            return CGSize(width: collectionView.frame.width / 2 - 30 , height: collectionView.frame.height / 2 - 50)

        }
    }
    
    //MARK: CollectionView DidSelectRow
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let index = indexPath.row
        
        guard let animatedCell = collectionView.cellForItem(at: indexPath) else {return}
        
        if collectionView == newProductCollectionView {
          
            animatedCell.showAnimation {
                
                let vc = ProductCardViewController()
                vc.id = self.data[index].id
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
        } else if collectionView == partnersCollectionView {
            
            animatedCell.showAnimation {
                
                UIApplication.shared.open(urlPartnersArray[index]!)
       
            }
        }
    }
}

//MARK: - extension UIView -

public extension UIView {
    func showAnimation(_ completionBlock: @escaping () -> Void) {
      isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: .curveLinear,
                       animations: { [weak self] in
                            self?.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
        }) {  (done) in
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: .curveLinear,
                           animations: { [weak self] in
                                self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }) { [weak self] (_) in
                self?.isUserInteractionEnabled = true
                completionBlock()
            }
        }
    }
    
    func makeShadow() {
        self.layer.shadowColor = UIColor.systemGray2.cgColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 5
    }
    
}

//MARK: - New Products Delegate -

extension MainViewController: NewProductManagerDelegate {
    func updateInterface(_: NetworkClient, with data: [ProductCardData]) {
        self.data = data.shuffled()

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

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        infoArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = infoArray[section]
        
        if section.isOpened {
            return section.options.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoTableViewCell
        let sizeCell = tableView.dequeueReusableCell(withIdentifier: "sizeContainerCell", for: indexPath) as! SizeContainerTableViewCell
        let contactCell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        
        cell.awakeFromNib()
        cell.selectionStyle = .none
        sizeCell.awakeFromNib()
        sizeCell.selectionStyle = .none
        
        DispatchQueue.main.async {
            contactCell.awakeFromNib()
            contactCell.selectionStyle = .none
        }
        
       
        
        if indexPath.row == 0 {
            
            cell.imagePoint.isHidden = true
            cell.imageArrow.isHidden = false
            cell.infoOptionLabel.text = ""
            cell.infoLabel.text = infoArray[indexPath.section].title
            
        } else {
    
            cell.imagePoint.isHidden = false
            cell.imageArrow.isHidden = true
            cell.infoLabel.text = ""
            cell.infoOptionLabel.text = infoArray[indexPath.section].options[indexPath.row - 1]

            if indexPath.section == 8 {
                sizeCell.infoOptionLabel.text = infoArray[indexPath.section].options[indexPath.row - 1]
                return sizeCell
            }

            if indexPath.section == 12 {
                
//                contactCell.infoOptionLabel.text = infoArray[indexPath.section].options[indexPath.row - 1]
                contactCell.contactButton.addTarget(self, action: #selector(contactButtonTapped), for: .touchUpInside)
                contactCell.contactButton.tag = indexPath.row
                
                if indexPath.row == 1 {
                    
                    contactCell.contactButton.tintColor = .blue
                    contactCell.contactButton.setImage(UIImage(systemName: "envelope"), for: .normal)

                } else if indexPath.row == 2 {
                    
                    contactCell.contactButton.tintColor = .green
                    contactCell.contactButton.setImage(UIImage(systemName: "phone"), for: .normal)
                    
                } else {
                    
                    contactCell.contactButton.isHidden = true
                    
                }
            return contactCell

            }
        }
        
        if infoArray[indexPath.section].isOpened {
            
            cell.imageArrow.image = UIImage(systemName: "chevron.up")
            
        } else {
            
            cell.imageArrow.image = UIImage(systemName: "chevron.down")
            
        }
        
        return cell
    }
    
    @objc func contactButtonTapped(sender: UIButton) {
        let buttonTag = sender.tag
        if buttonTag == 1 {
            print("email")
        } else if buttonTag == 2 {
            print("phone")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            infoArray[indexPath.section].isOpened = !infoArray[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        }
    }
}
