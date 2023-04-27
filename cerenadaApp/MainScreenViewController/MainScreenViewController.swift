//
//  MainScreenViewController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 27.04.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    private let layout = UICollectionViewFlowLayout()
    private var newProductCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
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
        
    }
    
    func setupUI() {
        view.backgroundColor = .systemGray6
        view.addSubview(newProductCollectionView)
        newProductCollectionView.delegate = self
        newProductCollectionView.dataSource = self
        newProductCollectionView.register(MainScreenNewProductsCollectionViewCell.self, forCellWithReuseIdentifier: "NewProductCell")
    }
    
    func setupStyle() {
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        
        newProductCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        newProductCollectionView.showsHorizontalScrollIndicator = false
        newProductCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        newProductCollectionView.backgroundColor = .clear
        newProductCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            newProductCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            newProductCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newProductCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newProductCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 1.625)
        ])
    }
}

//MARK: - UICollectionViewDelegate
extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewProductCell", for: indexPath) as! MainScreenNewProductsCollectionViewCell
        
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        cell.viewModel = cellViewModel
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.height / 2, height: collectionView.frame.height)
    }
    
}
