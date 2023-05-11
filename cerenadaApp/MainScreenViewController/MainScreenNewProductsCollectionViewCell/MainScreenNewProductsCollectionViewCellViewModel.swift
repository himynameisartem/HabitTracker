//
//  MainScreenNewProductsCollectionViewCellViewModel.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 27.04.2023.
//

import Foundation

class MainScreenNewProductsCollectionViewCellViewModel: MainScreenNewProductsCollectionViewCellViewModelProtocol {
    
    private var product: Product
    
    func galleryCellViewModel(for indexPath: IndexPath) -> NewProductGalleryCollectionViewCellViewModelProtocol? {
        guard let image = product.images?[indexPath.row] else { return nil }
        return NewProductGalleryCollectionViewCellViewModel(image: image)
    }
    
    func numberOfItems() -> Int? {
        return product.images?.count
    }
    
    var productName: String? {
        return product.name
    }
    var productPrice: String? {
        return product.price
    }
    
    
    required init(product: Product) {
        self.product = product
    }
    
    
}
