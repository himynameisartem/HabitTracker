//
//  MainScreenViewModel.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 27.04.2023.
//

import Foundation

class MainScreenViewModel: MainScreenViewModelProtocol {
    
        //NewProductsCollectionView
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
    
        //InformationTableView
    var information: [Information] = informationData
    func numberOfSection() -> Int? {
        return information.count
    }
    func informationSectionCellViewModel(for indexPath: IndexPath) -> InformationTableViewCellViewModelProtocol? {
        let information = information[indexPath.section]
        return InformationTableViewCellViewModel(information: information)
    }
    func informationSelectedRow(for indexPath: IndexPath) {
        self.indexPath = indexPath
    }
    func isOpenedeSectionChanged(section: Int) {
        self.information[section].isOpened.toggle()
    }
    
    
        //SizeTableViewCell
    var size: Size = sizeData
    func sizeCellViewModel() -> SizeTableViewCellViewModelProtocol? {
        return SizeTableViewCellViewModel(size: size)
    }
        //ContactsTableViewCell
    var contacts: Contacts = contactsData
    func contactsCellViewModel() -> ContactsTableViewCellViewModelProtocol? {
        return ContactsTableViewCellViewModel(contacts: contacts)
    }
}
