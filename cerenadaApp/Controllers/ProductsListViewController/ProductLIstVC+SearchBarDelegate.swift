//
//  ProductLIstVC+SearchBarDelegate.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 09.03.2023.
//

import UIKit


extension ProductsListViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
    
        
        guard let text = searchController.searchBar.text else { return }
        if !text.isEmpty {
            self.searchListClient.request(searchText: text)
            self.productCollectionView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        productList.removeAll()
        productCollectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        if !text.isEmpty {
            self.searchListClient.request(searchText: text)
            self.productCollectionView.reloadData()
        }
    }
}
