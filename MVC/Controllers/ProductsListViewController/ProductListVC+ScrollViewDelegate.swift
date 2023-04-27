//
//  ProductListVC+ScrollViewDelegate.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 28.02.2023.
//

import UIKit

extension ProductsListViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
                
        guard let top = window?.safeAreaInsets.top else { return }
        let heightNavigationView = 96 - (top < 21 ? top : 0)
        
        let categoriesIsHidden: Bool = self.productCollectionView.contentOffset.y > currentScale ? false : true
    
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn) {
            
            if !categoriesIsHidden {
                if self.topCategoryCollectionViewConstraint.constant == heightNavigationView {
                    self.topCategoryCollectionViewConstraint.constant -= 50
                    self.view.layoutIfNeeded()
                    }
            } else {
                if self.topCategoryCollectionViewConstraint.constant == heightNavigationView - 50 {
                    self.topCategoryCollectionViewConstraint.constant += 50
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
        
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {

        currentScale = productCollectionView.contentOffset.y
            
    }
}
