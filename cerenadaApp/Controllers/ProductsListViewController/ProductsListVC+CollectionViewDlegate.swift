//
//  ProductsListVC+CollectionViewDlegate.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 20.02.2023.
//

import UIKit

protocol SelectCategoriesViewCellProtocol: AnyObject {
    func categoryName(name: String)
}

extension ProductsListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == productCollectionView{
            return productList.count
        } else {
            return categories.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == productCollectionView {
            
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
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoriesCell", for: indexPath) as! CategoriesCollectionViewCell
            
            cell.categoryNameLabel.alpha = 0.7
            cell.categoryNameLabel.text = categories[indexPath.item]
            
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == productCollectionView {
            return CGSize(width: (collectionView.frame.width / 2) - 5, height: collectionView.frame.width / 1.17)
        } else {
            let categoryFont = UIFont(name: "Helvetica-Bold", size: 20)
            let categoryAttributes = [NSAttributedString.Key.font : categoryFont as Any]
            let categoryWidth = categories[indexPath.item].size(withAttributes: categoryAttributes).width + 5
            
            return CGSize(width: categoryWidth,
                          height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let animatedCell = collectionView.cellForItem(at: indexPath) else {return}
        
        if collectionView == categoriesCollectionView {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//            animatedCell.showAnimation {
                self.categoryDelegate?.categoryName(name: categories[indexPath.row])
//            }
        }
        
        if collectionView == productCollectionView {
            animatedCell.showAnimation {
                print("tapped product")
            }
            
        }
    }
    
}
