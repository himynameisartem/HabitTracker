//
//  MainScreenViewControllerViewModelProtocol.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 27.04.2023.
//

import Foundation

protocol MainScreenViewModelProtocol {
    var newProducts: [Product] { get }
    func fetchNewProducts(complition: @escaping() -> Void)
    func numberOfItems() -> Int?
    func cellViewModel(for indexPath: IndexPath) -> MainScreenNewProductsCollectionViewCellViewModelProtocol?
    func selectedRow(for indexPath: IndexPath)
}
