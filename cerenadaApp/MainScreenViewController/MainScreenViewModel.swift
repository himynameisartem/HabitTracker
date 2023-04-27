//
//  MainScreenViewModel.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 27.04.2023.
//

import Foundation

class MainScreenViewModel: MainScreenViewModelProtocol {

    var newProducts: [Product] = []
    private var indexPath: IndexPath?
    func numberOfItems() -> Int? {
        return newProducts.count
    }
    func cellViewModel(for indexPath: IndexPath) -> MainScreenNewProductsCollectionViewCellViewModelProtocol? {
        let product = newProducts[indexPath.row]
        return MainScreenNewProductsCollectionViewCellViewModel(product: product)
    }
    
    func selectedRow(for indexPath: IndexPath) {
        self.indexPath = indexPath
    }
    
    func fetchNewProducts(complition: @escaping () -> Void) {
        NetworkManager.shared.request { products in
            self.newProducts = products
            complition()
        }
    }
}
