//
//  ProductLIstVC+SearchBarDelegate.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 09.03.2023.
//

import UIKit


extension ProductsListViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        print(searchController.searchBar.text!)
        
//        self.productListClient.request(category: 2236)
//        self.productCollectionView.reloadData()
    
    }
}
