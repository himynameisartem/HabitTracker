//
//  MainVC+CollectionViews.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 09.02.2023.
//

import UIKit
import MessageUI

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == presentationCollectionView {
            return previewArray.count
        } else if collectionView == newProductCollectionView {
            if data.count < 10 {
                return data.count
            } else {
                return 10
            }
        } else {
            return 4
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == presentationCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "presentationCell", for: indexPath) as! PresentationCollectionViewCell
            
            cell.previewImageView.image = UIImage(named: previewArray[indexPath.row])
            
            return cell
        } else if collectionView == newProductCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newProductCell", for: indexPath) as! NewProductsCollectionViewCell
            
            DispatchQueue.main.async {
                
                cell.productImageView.kf.indicatorType = .activity
                cell.productImageView.kf.setImage(with: URL(string: self.data[indexPath.row].images[0].src.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? self.data[indexPath.row].images[0].src))
            }
            
            cell.productName.text = data[indexPath.row].name
            cell.productPrice.text = price[indexPath.row] + " ₽"
            
            
            return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "partnersCell", for: indexPath) as! PartnersCollectionViewCell
            
            cell.partnersImageView.image = UIImage(named: partnersArray[indexPath.row])
            
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == presentationCollectionView {
            
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
            
        } else if collectionView == newProductCollectionView {
            
            return CGSize(width: collectionView.frame.height / 2, height: collectionView.frame.height)
            
        } else {
            
            return CGSize(width: collectionView.frame.width / 2 - 30 , height: collectionView.frame.height / 2 - 50)
            
        }
    }
    
    //MARK: CollectionView DidSelectRow
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let index = indexPath.row
        
        guard let animatedCell = collectionView.cellForItem(at: indexPath) else {return}
        
        if collectionView == newProductCollectionView {
            
            animatedCell.showAnimation {
                
                let vc = ProductCardViewController()
                vc.id = self.data[index].id
                self.navigationController?.navigationBar.isHidden = true
                self.navigationController?.navigationBar.prefersLargeTitles = false
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
        } else if collectionView == partnersCollectionView {
            
            animatedCell.showAnimation {
                
                UIApplication.shared.open(urlPartnersArray[index]!)
                
            }
        }
    }
}
