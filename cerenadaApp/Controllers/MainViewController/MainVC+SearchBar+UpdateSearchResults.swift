//
//  MainVC+SearchBar+UpdateSearchResults.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 09.02.2023.
//

import UIKit

extension MainViewController: UISearchControllerDelegate {
    
    func createSearchBar() {
                
        searchController.searchResultsUpdater = vc
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.layer.borderColor = UIColor.white.cgColor
        searchController.definesPresentationContext = false
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.showsSearchResultsController = true
        searchController.searchBar.sizeToFit()
        
        navigationItem.searchController = searchController
        
    }
    
}
