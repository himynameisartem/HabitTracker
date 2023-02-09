//
//  ProductCardVC+CollectionViews.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 09.02.2023.
//

import UIKit

extension ProductCardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == galleryCollectionView {
            return images.count
        }
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == galleryCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "galleryCell", for: indexPath) as! GalleryCollectionViewCell
            
            DispatchQueue.main.async {
                cell.galleryImageView.kf.indicatorType = .activity
                cell.galleryImageView.kf.setImage(with: URL(string: self.images[indexPath.row].src.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? self.images[indexPath.row].src))
            }
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewCell", for: indexPath) as! ReviewsCollectionViewCell
        
        cell.shadowView.makeShadow()
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == galleryCollectionView {
            
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
            
        } else {
            
            return CGSize(width: view.frame.width / 1.2 , height: 180)
            
        }
        
    }
    
}
