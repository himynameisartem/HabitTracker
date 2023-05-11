//
//  NewProductGalleryCollectionViewCellViewModelProtocol.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 10.05.2023.
//

import Foundation

protocol NewProductGalleryCollectionViewCellViewModelProtocol {
    var images: Images? { get }
    init(image: Images)
}
