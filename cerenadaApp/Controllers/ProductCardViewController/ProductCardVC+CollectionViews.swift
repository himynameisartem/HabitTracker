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
        
        if collectionView == reviewsCollectionView {
            return reviews.count
        }
        
        if collectionView == relatedCollectionView{
            return related.count
        }
        
        return 0
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
        
        if collectionView == reviewsCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewCell", for: indexPath) as! ReviewsCollectionViewCell
            
            cell.shadowView.makeShadow()
            cell.userNameLabel.text = reviews[indexPath.row].reviewer
            cell.rewiewLabel.text = String(reviews[indexPath.row].review.dropFirst(3).dropLast(5))
            cell.publishDataLabel.text = "12.02.2021, 14:41"
            
            DispatchQueue.main.async {
                cell.userPic.kf.indicatorType = .activity
                cell.userPic.kf.setImage(with: URL(string: self.reviews[indexPath.row].reviewer_avatar_urls.userPic48))
                
            }
            
            return cell
            
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "relatedCell", for: indexPath) as! RelatedCollectionViewCell

        DispatchQueue.main.async {
            cell.productImageView.kf.indicatorType = .activity
            cell.productImageView.kf.setImage(with: URL(string: self.related[indexPath.row].images[0].src))
        }

        cell.productName.text = related[indexPath.row].name
        cell.productPrice.text = related[indexPath.row].price
        
        return cell
                
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == galleryCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }

        if collectionView == relatedCollectionView {
            return CGSize(width: collectionView.frame.height / 2, height: collectionView.frame.height)
        } else {
            return CGSize(width: view.frame.width / 1.2 , height: 170)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        item = indexPath.item
        
        if collectionView == galleryCollectionView {
            galleryPageControl.currentPage = indexPath.item
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        guard let animatedCell = collectionView.cellForItem(at: indexPath) else {return}
        
        if collectionView == relatedCollectionView {
            animatedCell.showAnimation {
                
                let vc = ProductCardViewController()
                vc.id = self.related[index].id
                vc.discription = self.related[index].description
                vc.ids = self.related[index].related_ids ?? [0]
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
