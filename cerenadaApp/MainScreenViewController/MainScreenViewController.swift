//
//  MainScreenViewController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 27.04.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    private let resultsViewController = ResultsViewController()
    private let scrollView = UIScrollView()
    private let myNavigationBar = UINavigationBar()
    private var navigationLogoImageView: UIImageView!
    private var infoButton: UIButton!
    private var informationTableView = UITableView()
    private var searchController: UISearchController!
    private let shadowViewForPresentationCollectionView = UIView()
    private let previewCollectionViewLayout = UICollectionViewFlowLayout()
    private var previewCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var previewPageView = UIPageControl()
    private var timer = Timer()
    private var counter = 0
    private let newProductsLabel = UILabel()
    private let newProductCollectionViewlayout = UICollectionViewFlowLayout()
    private var newProductCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let ourPartnersLabel = UILabel()
    private let ourPartnersCollectionViewLayout = UICollectionViewFlowLayout()
    private var ourPartnersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    private var viewModel: MainScreenViewModelProtocol! {
        didSet {
            viewModel.fetchNewProducts {
                DispatchQueue.main.async {
                    self.newProductCollectionView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MainScreenViewModel()
        setupStyle()
        setupUI()
        setupConstraints()
        createTimer()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemGray6
        view.addSubview(myNavigationBar)
        myNavigationBar.addSubview(navigationLogoImageView)
        navigationController?.navigationBar.addSubview(infoButton)
        navigationItem.searchController = searchController
        view.addSubview(scrollView)
        scrollView.addSubview(shadowViewForPresentationCollectionView)
        shadowViewForPresentationCollectionView.addSubview(previewCollectionView)
        scrollView.addSubview(previewPageView)
        scrollView.addSubview(newProductCollectionView)
        scrollView.addSubview(newProductsLabel)
        scrollView.addSubview(ourPartnersLabel)
        scrollView.addSubview(ourPartnersCollectionView)
    }
    
    private func setupStyle() {
        //SetupNavigationBar
        navigationController?.navigationBar.prefersLargeTitles = true
        myNavigationBar.frame = CGRect(x: 0, y: SafeAreaManager.shared.safeAreaInsets().top, width: view.frame.width, height: 148)
        myNavigationBar.backgroundColor = .clear
        myNavigationBar.setBackgroundImage(UIImage(), for: .default)
        myNavigationBar.shadowImage = UIImage()
        navigationLogoImageView = UIImageView(image: UIImage(named: "logo"))
        navigationLogoImageView.contentMode = .scaleAspectFit
        navigationLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //setupScrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        //SetupInfoButton
        infoButton = UIButton()
        infoButton.setImage(UIImage(named: "info"), for: .normal)
        infoButton.tintColor = .black
        infoButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchDown)
        
        //SetupShadowViewForPresentationCollectionView
        shadowViewForPresentationCollectionView.translatesAutoresizingMaskIntoConstraints = false
        shadowViewForPresentationCollectionView.makeShadow()
        
        //SetupPresentationCollectionView
        previewCollectionViewLayout.scrollDirection = .horizontal
        previewCollectionViewLayout.minimumLineSpacing = 0
        previewCollectionViewLayout.minimumInteritemSpacing = 0
        previewCollectionView = UICollectionView(frame: .zero, collectionViewLayout: previewCollectionViewLayout)
        previewCollectionView.showsHorizontalScrollIndicator = false
        previewCollectionView.layer.cornerRadius = 10
        previewCollectionView.isUserInteractionEnabled = false
        previewCollectionView.translatesAutoresizingMaskIntoConstraints = false
        previewCollectionView.register(PreviewCollectionViewCell.self, forCellWithReuseIdentifier: "previewCell")
        previewCollectionView.delegate = self
        previewCollectionView.dataSource = self
        previewPageView.translatesAutoresizingMaskIntoConstraints = false
        previewPageView.currentPage = 0
        previewPageView.numberOfPages = previewArray.count
        previewPageView.activityItemsConfiguration = .none
        previewPageView.isUserInteractionEnabled = false
        previewPageView.pageIndicatorTintColor = .systemGray5
        previewPageView.currentPageIndicatorTintColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        
        //SetupNewProductCollectionView
        newProductsLabel.text = "НОВИНКИ"
        newProductsLabel.translatesAutoresizingMaskIntoConstraints = false
        newProductsLabel.font = UIFont(name: "helvetica-bold", size: 24)
        newProductsLabel.textColor = .systemGray
        
        newProductCollectionViewlayout.scrollDirection = .horizontal
        newProductCollectionViewlayout.minimumLineSpacing = 10
        newProductCollectionViewlayout.minimumInteritemSpacing = 0
        newProductCollectionView = UICollectionView(frame: .zero, collectionViewLayout: newProductCollectionViewlayout)
        newProductCollectionView.showsHorizontalScrollIndicator = false
        newProductCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        newProductCollectionView.backgroundColor = .clear
        newProductCollectionView.translatesAutoresizingMaskIntoConstraints = false
        newProductCollectionView.register(MainScreenNewProductsCollectionViewCell.self, forCellWithReuseIdentifier: "NewProductCell")
        newProductCollectionView.register(NewProductTransitionViewCell.self, forCellWithReuseIdentifier: "newProductTransitionCell")
        newProductCollectionView.delegate = self
        newProductCollectionView.dataSource = self
        
        //SetupInformationTableView
        informationTableView.translatesAutoresizingMaskIntoConstraints = false
        informationTableView.separatorStyle = .none
        informationTableView.showsVerticalScrollIndicator = false
        informationTableView.register(InformationTableViewCell.self, forCellReuseIdentifier: "informationCell")
        informationTableView.register(ContainerTableViewCell.self, forCellReuseIdentifier: "containerCell")
        informationTableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: "contactsCell")
        informationTableView.delegate = self
        informationTableView.dataSource = self
        
        //SetupSearchBar
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController.searchResultsUpdater = resultsViewController
        searchController.searchBar.barTintColor = .systemGray6
        searchController.searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchController.searchBar.searchBarStyle = .minimal
        searchController.showsSearchResultsController = true
        searchController.delegate = self
        searchController.searchBar.delegate = self
        
        //OurPartners
        ourPartnersLabel.translatesAutoresizingMaskIntoConstraints = false
        ourPartnersLabel.text = "НАШИ ПАРТНЕРЫ"
        ourPartnersLabel.font = UIFont(name: "helvetica-bold", size: 24)
        ourPartnersLabel.textColor = .systemGray
        ourPartnersCollectionViewLayout.minimumLineSpacing = 20
        ourPartnersCollectionViewLayout.minimumInteritemSpacing = 0
        ourPartnersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: ourPartnersCollectionViewLayout)
        ourPartnersCollectionView.register(OurPartnersCollectionViewCell.self, forCellWithReuseIdentifier: "ourPartnersCell")
        ourPartnersCollectionView.showsHorizontalScrollIndicator = false
        ourPartnersCollectionView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
        ourPartnersCollectionView.layer.cornerRadius = 10
        ourPartnersCollectionView.backgroundColor = .clear
        ourPartnersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        ourPartnersCollectionView.makeShadow()
        ourPartnersCollectionView.delegate = self
        ourPartnersCollectionView.dataSource = self
        
    }
    
    //MethodForInfoButton
    @objc func infoButtonTapped(sender: UIButton) {
        sender.showAnimation {
            InformationView.informationView.showInformation(viewController: self, tableView: self.informationTableView)
        }
    }
    
    private func setupConstraints() {
        
        guard let navigationBar = navigationController?.navigationBar else { return }
        //SetupNavigationBarConstraints
        NSLayoutConstraint.activate([
            navigationLogoImageView.centerXAnchor.constraint(equalTo: myNavigationBar.centerXAnchor),
            navigationLogoImageView.centerYAnchor.constraint(equalTo: myNavigationBar.centerYAnchor ,constant: -30),
            navigationLogoImageView.topAnchor.constraint(greaterThanOrEqualTo: myNavigationBar.topAnchor, constant: 10),
            
        ])
        
        //SetupInfoButtonConstraints
        NSLayoutConstraint.activate([
            infoButton.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor, constant: -30),
            infoButton.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -20),
            infoButton.heightAnchor.constraint(equalToConstant: 40),
            infoButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        //SetupScrolllViewConstraints
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: myNavigationBar.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        //SetupShadowViewForPresentationCollectionViewConstraint
        NSLayoutConstraint.activate([
            shadowViewForPresentationCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 10),
            shadowViewForPresentationCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 20),
            shadowViewForPresentationCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            shadowViewForPresentationCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 1.625),
        ])
        
        //SetupPresentationCollectionViewConstraint
        NSLayoutConstraint.activate([
            previewCollectionView.topAnchor.constraint(equalTo: shadowViewForPresentationCollectionView.topAnchor),
            previewCollectionView.leadingAnchor.constraint(equalTo: shadowViewForPresentationCollectionView.leadingAnchor),
            previewCollectionView.trailingAnchor.constraint(equalTo: shadowViewForPresentationCollectionView.trailingAnchor),
            previewCollectionView.bottomAnchor.constraint(equalTo: shadowViewForPresentationCollectionView.bottomAnchor),
            previewPageView.leadingAnchor.constraint(equalTo: previewCollectionView.leadingAnchor),
            previewPageView.trailingAnchor.constraint(equalTo: previewCollectionView.trailingAnchor),
            previewPageView.bottomAnchor.constraint(equalTo: previewCollectionView.bottomAnchor),
        ])
        
        //SetupNewProductCollectionViewConstraints
        NSLayoutConstraint.activate([
            newProductsLabel.topAnchor.constraint(equalTo: previewCollectionView.bottomAnchor, constant: 20),
            newProductsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newProductCollectionView.topAnchor.constraint(equalTo: newProductsLabel.bottomAnchor, constant: 10),
            newProductCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newProductCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newProductCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 1.625),
        ])
        
        //OurPartnersCollectionViewConstraints
        NSLayoutConstraint.activate([
            ourPartnersLabel.topAnchor.constraint(equalTo: newProductCollectionView.bottomAnchor, constant: 20),
            ourPartnersLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ourPartnersCollectionView.topAnchor.constraint(equalTo: ourPartnersLabel.bottomAnchor),
            ourPartnersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ourPartnersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ourPartnersCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            ourPartnersCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 1.34)

        ])
    }
}

//MARK: - UICollectionViewDataSource

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == previewCollectionView {
            return viewModel.previewImages.count
        } else if collectionView == newProductCollectionView {
            guard let count = viewModel.numberOfItems() else { return 0 }
            return count <= 11 ? count : 11
        } else if collectionView == ourPartnersCollectionView{
            return 4
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == previewCollectionView {
            
            let previewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "previewCell",
                for: indexPath) as! PreviewCollectionViewCell
            let cellViewModel = viewModel.previewCellViewModel(for: indexPath)
            previewCell.viewModel = cellViewModel
            
            return previewCell
            
        } else if collectionView == newProductCollectionView {
            
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "NewProductCell",
                for: indexPath) as! MainScreenNewProductsCollectionViewCell
            
            let cellViewModel = viewModel.cellViewModel(for: indexPath)
            cell.viewModel = cellViewModel
            
            if indexPath.row == 10 {
                
                let transitionCell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "newProductTransitionCell",
                    for: indexPath) as! NewProductTransitionViewCell
                return transitionCell
            }
            return cell
            
        } else if collectionView == ourPartnersCollectionView {
            
            let ourPartnersCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "ourPartnersCell",
                for: indexPath) as! OurPartnersCollectionViewCell
            let viewModel = viewModel.partnersViewModel(for: indexPath)
            ourPartnersCell.viewModel = viewModel

            return ourPartnersCell
        } else {
            return UICollectionViewCell()
    }
}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == previewCollectionView {
            return CGSize(width: previewCollectionView.frame.width, height: previewCollectionView.frame.height)
        } else if collectionView == newProductCollectionView {
            return CGSize(width: collectionView.frame.height / 2, height: collectionView.frame.height)
        } else if collectionView == ourPartnersCollectionView {
            return CGSize(width: collectionView.frame.width / 2 - 30 , height: collectionView.frame.height / 2 - 50)
        } else {
            return CGSize()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let animatedCell = collectionView.cellForItem(at: indexPath) else {return}
        if collectionView == ourPartnersCollectionView {
            
            animatedCell.showAnimation {
                guard let url = URL(string: self.viewModel.partners[indexPath.row].link) else { return }
                UIApplication.shared.open(url)
            }
        }
    }
}

//MARK: - UITableViewDataSource

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.information.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = viewModel.information[section]
        
        if section.isOpened {
            return section.options.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "informationCell", for: indexPath) as! InformationTableViewCell
        let containerCell = tableView.dequeueReusableCell(withIdentifier: "containerCell", for: indexPath) as! ContainerTableViewCell
        let contactsCell = tableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath) as! ContactsTableViewCell
        
        let cellViewModel = viewModel.informationSectionCellViewModel(for: indexPath)
        let contactsViewModel = viewModel.contactsCellViewModel()
        
        cell.awakeFromNib()
        containerCell.awakeFromNib()
        DispatchQueue.main.async {
            contactsCell.awakeFromNib()
        }
        
        if indexPath.row == 0 {
            cell.sectionViewModel = cellViewModel
        } else {
            cell.indexPath = indexPath
            cell.rowViewModel = cellViewModel
            
            if indexPath.section == 8 {
                containerCell.indexPath = indexPath
                containerCell.containerViewModel = cellViewModel
                return containerCell
            }
            
            if indexPath.section == 12 {
                contactsCell.indexPath = indexPath
                contactsCell.infoViewModel = cellViewModel
                contactsCell.viewModel = contactsViewModel
                return contactsCell
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            self.viewModel.isOpenedeSectionChanged(section: indexPath.section)
            tableView.reloadSections([indexPath.section], with: .none)
        }
    }
}

//MARK: - SearchControllerDelegate

extension MainScreenViewController: UISearchControllerDelegate, UISearchBarDelegate {
    
    func willPresentSearchController(_ searchController: UISearchController) {
        infoButton.isHidden = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        infoButton.isHidden = false
    }}

//MARK: - Timer

extension MainScreenViewController {
    
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
            self.previewCollectionView.scrollToItem(at: index,
                                                    at: .centeredHorizontally,
                                                    animated: true)
            previewPageView.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.previewCollectionView.scrollToItem(at: index,
                                                    at: .centeredHorizontally,
                                                    animated: true)
            previewPageView.currentPage = counter
            counter = 1
        }
    }
}
