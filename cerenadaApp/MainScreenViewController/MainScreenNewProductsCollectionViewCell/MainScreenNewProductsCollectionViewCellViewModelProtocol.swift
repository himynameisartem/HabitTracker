//
//  MainScreenNewProductsCollectionViewCellViewModelProtocol.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 27.04.2023.
//

import Foundation

protocol MainScreenNewProductsCollectionViewCellViewModelProtocol {
    var productName: String? { get }
    var productPrice: String? { get }
    func numberOfItems() -> Int?
    func galleryCellViewModel(for indexPath: IndexPath) -> NewProductGalleryCollectionViewCellViewModelProtocol?
    init(product: Product)
}
