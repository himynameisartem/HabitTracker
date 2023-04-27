//
//  MainScreenNewProductsCollectionViewCellViewModelProtocol.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 27.04.2023.
//

import Foundation

protocol MainScreenNewProductsCollectionViewCellViewModelProtocol {
    var productImage: Data? { get }
    var productName: String? { get }
    var productPrice: String? { get }
    init(product: Product)
}
