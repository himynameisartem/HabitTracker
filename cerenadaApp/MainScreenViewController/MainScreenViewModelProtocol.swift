//
//  MainScreenViewControllerViewModelProtocol.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 27.04.2023.
//

import Foundation

protocol MainScreenViewModelProtocol {
        //NewProduct
    var newProducts: [Product] { get }
    func fetchNewProducts(complition: @escaping() -> Void)
    func numberOfItems() -> Int?
    func cellViewModel(for indexPath: IndexPath) -> MainScreenNewProductsCollectionViewCellViewModelProtocol?
    func selectedRow(for indexPath: IndexPath)
    
        //Information
    var information: [Information] { get }
    func numberOfSection() -> Int?
    func informationSectionCellViewModel(for indexPath: IndexPath) -> InformationTableViewCellViewModelProtocol?
    func isOpenedeSectionChanged(section: Int)
    func informationSelectedRow(for indexPath: IndexPath)
    
        //Size
    var size: Size { get }
    func sizeCellViewModel() -> SizeTableViewCellViewModelProtocol?
    
        //Contacts
    var contacts: Contacts { get }
    func contactsCellViewModel() -> ContactsTableViewCellViewModelProtocol?
}
