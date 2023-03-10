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
            cell.layer.cornerRadius = 10
            cell.makeShadow()
            
            cell.galleryPageControl.numberOfPages = productList[indexPath.row].images.count
            cell.images = productList[indexPath.row].images
            cell.nameLabel.text = productList[indexPath.row].name
            cell.priceLabel.text = " " + productList[indexPath.row].price + " ₽ "
            cell.nameLabel.font = UIFont(name: "Helvetica-Bold", size: fontSizeForNameLabel(viewHeight: view.frame.height))
            cell.priceLabel.font = UIFont(name: "Helvetica", size: fontSizeForPriceLabel(viewHeight: view.frame.height))

            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            cell.likeButton.tag = indexPath.item

            cell.tapGesture.addTarget(self, action: #selector(tapItem))
            cell.tapGesture.view?.tag = indexPath.item
            
            cell.galleryCollectionView.reloadData()
            
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
                
        if collectionView == categoriesCollectionView {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.categoryDelegate?.categoryName(name: categories[indexPath.row])
        }
    }
}


//MARK: - objc Method

extension ProductsListViewController {
    
    @objc func tapItem(sender: UITapGestureRecognizer) {
        
        
        guard let tag = sender.view?.tag else { return }
        let index = IndexPath(item: tag, section: 0)
        guard let animatedCell = productCollectionView.cellForItem(at: index) else {return}
        animatedCell.showAnimation {
            let vc = ProductCardViewController()
            vc.id = self.productList[index.item].id
            vc.discription = self.productList[index.item].description
            vc.ids = self.productList[index.item].related_ids ?? [0]
            self.navigationController?.pushViewController(vc, animated: true)
            
            if self.searchIsActive {
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        }
    }
    
    @objc func likeButtonTapped(sender: UIButton) {
        let index = IndexPath(item: sender.tag, section: 0)
        
        if selectedLikeImage == "heart" {
            selectedLikeImage = "heart.fill"
        } else {
            selectedLikeImage = "heart"
        }
        
        sender.showAnimation {
            sender.setImage(UIImage(systemName: self.selectedLikeImage), for: .normal)
            print(index.item)
        }
    }
}
