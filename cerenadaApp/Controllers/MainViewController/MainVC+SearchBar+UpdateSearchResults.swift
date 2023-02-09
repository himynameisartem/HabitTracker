//
//  MainVC+SearchBar+UpdateSearchResults.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 09.02.2023.
//

import UIKit

extension MainViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    func createSearchBar() {
        
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.layer.borderColor = UIColor.white.cgColor
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.navigationController?.hidesBarsOnSwipe = false
        searchController.searchBar.sizeToFit()
        
        navigationItem.searchController = searchController

    }
    
    func updateSearchResults(for searchController: UISearchController) {
       
    }
}
