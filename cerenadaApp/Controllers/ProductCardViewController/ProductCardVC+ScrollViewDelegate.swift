//
//  ProductCardVC+ScrollViewDelegate.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 09.02.2023.
//

import UIKit

extension ProductCardViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        DispatchQueue.main.async {
            
            guard let top = self.window?.safeAreaInsets.top else { return }
            let safeArea = top < 21 ? top : 0
            
            let height = self.galleryCollectionView.frame.height - (self.backButton.frame.height + 20) - safeArea
            let alpha: CGFloat = self.scrollView.contentOffset.y > height ? 1 : 0
            let exitButtonColor: UIColor = self.scrollView.contentOffset.y > height  ? .white : #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
            
            UIView.animate(withDuration: 0.5, delay: 0) {
                self.navigationView.alpha = alpha
                self.backButton.tintColor = exitButtonColor
            }
        }
    }
    
}
