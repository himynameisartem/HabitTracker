//
//  MainScreenNewProductsCollectionViewCellViewModel.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 27.04.2023.
//

import Foundation

class MainScreenNewProductsCollectionViewCellViewModel: MainScreenNewProductsCollectionViewCellViewModelProtocol {
    
    private var product: Product
    var productImage: Data? {
        guard let image = product.images?[0].src else { return nil }
        return ImageManager.shared.getImageData(from: image)
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
