//
//  ProductsListVC+CollectionViewDlegate.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 20.02.2023.
//

import UIKit

extension ProductsListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCollectionViewCell
        
        cell.galleryPageControl.numberOfPages = productList[indexPath.row].images.count
        cell.images = productList[indexPath.row].images
        cell.nameLabel.text = productList[indexPath.row].name
        cell.priceLabel.text = " " + productList[indexPath.row].price + " ₽ "
        
        cell.nameLabel.font = UIFont(name: "Helvetica-Bold", size: fontSizeForNameLabel(viewHeight: view.frame.height))
        cell.priceLabel.font = UIFont(name: "Helvetica", size: fontSizeForPriceLabel(viewHeight: view.frame.height))
        
        cell.galleryCollectionView.reloadData()
        
        cell.layer.cornerRadius = 10
        cell.makeShadow()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == productCollectionView {
            return CGSize(width: (collectionView.frame.width / 2) - 5, height: collectionView.frame.width / 1.17)
        }
        
        
        
        return CGSize()
    }

}
