//
//  CategoriesVC+SearchControllerDelegate.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 11.03.2023.
//

import UIKit

extension CategoriesViewController: UISearchControllerDelegate {
    
    func settingsSearchController() {
        
        searchController.searchResultsUpdater = vc
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.layer.borderColor = UIColor.white.cgColor
        searchController.definesPresentationContext = false
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.showsSearchResultsController = true
        searchController.searchBar.sizeToFit()

    }
    
}
