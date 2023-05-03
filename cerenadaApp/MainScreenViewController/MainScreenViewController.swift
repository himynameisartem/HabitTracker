//
//  MainScreenViewController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 27.04.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    private let myNavigationBar = UINavigationBar()
    private var navigationLogoImageView: UIImageView!
    private var infoButton: UIButton!
    private let layout = UICollectionViewFlowLayout()
    private var newProductCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var informationTableView = UITableView()
    
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
        
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupUI() {
        view.backgroundColor = .systemGray6
        view.addSubview(myNavigationBar)
        myNavigationBar.addSubview(navigationLogoImageView)
        myNavigationBar.addSubview(infoButton)
        view.addSubview(newProductCollectionView)
        
        newProductCollectionView.delegate = self
        newProductCollectionView.dataSource = self
        newProductCollectionView.register(MainScreenNewProductsCollectionViewCell.self, forCellWithReuseIdentifier: "NewProductCell")
        
        informationTableView.delegate = self
        informationTableView.dataSource = self

    }
    
    private func setupStyle() {
            //SetupNavigationBar
        myNavigationBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 100)
        myNavigationBar.backgroundColor = .clear
        myNavigationBar.setBackgroundImage(UIImage(), for: .default)
        myNavigationBar.shadowImage = UIImage()
        navigationLogoImageView = UIImageView(image: UIImage(named: "logo"))
        navigationLogoImageView.contentMode = .scaleAspectFit
        navigationLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        
            //SetupInfoButton
        infoButton = UIButton()
        infoButton.setImage(UIImage(named: "info"), for: .normal)
        infoButton.tintColor = .black
        infoButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchDown)
        
            //SetupNewProductCollectionView
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        newProductCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        newProductCollectionView.showsHorizontalScrollIndicator = false
        newProductCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        newProductCollectionView.backgroundColor = .clear
        newProductCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
            //SetupInformationTableView
        informationTableView.translatesAutoresizingMaskIntoConstraints = false
        informationTableView.separatorStyle = .none
        informationTableView.showsVerticalScrollIndicator = false
        informationTableView.register(InformationTableViewCell.self, forCellReuseIdentifier: "informationCell")
        informationTableView.register(ContainerTableViewCell.self, forCellReuseIdentifier: "containerCell")
        informationTableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: "contactsCell")
        
    }
    
        //MethodForInfoButton
    @objc func infoButtonTapped(sender: UIButton) {
        sender.showAnimation {
            //ForInfoButtonCode
            InformationView.informationView.showInformation(viewController: self, tableView: self.informationTableView)
        }
    }
    
    private func setupConstraints() {
            //SetupNavigationBarConstraints
        NSLayoutConstraint.activate([
            navigationLogoImageView.centerXAnchor.constraint(equalTo: myNavigationBar.centerXAnchor),
            navigationLogoImageView.topAnchor.constraint(
                equalTo: myNavigationBar.topAnchor,
                constant: SafeAreaManager.shared.safeAreaInsets().top),
            navigationLogoImageView.bottomAnchor.constraint(equalTo: myNavigationBar.bottomAnchor),
        ])
        
            //SetupInfoButtonConstraints
        NSLayoutConstraint.activate([
            infoButton.centerYAnchor.constraint(equalTo: navigationLogoImageView.centerYAnchor),
            infoButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20),
            infoButton.heightAnchor.constraint(equalToConstant: 40),
            infoButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
            //SetupNewProductCollectionViewConstraints
        NSLayoutConstraint.activate([
            newProductCollectionView.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: myNavigationBar.frame.height + 10),
            newProductCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newProductCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newProductCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 1.625),
        ])
    }
}

//MARK: - UICollectionViewDataSource

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = viewModel.numberOfItems() else { return 0 }
        return count <= 10 ? count : 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewProductCell", for: indexPath) as! MainScreenNewProductsCollectionViewCell
        
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        cell.viewModel = cellViewModel
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        cell.showAnimation {
            //ForTransitionCode
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.height / 2, height: collectionView.frame.height)
    }
}

//MARK: UITableViewDataSource

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
