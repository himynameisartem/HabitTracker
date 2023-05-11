//
//  OurPartnersCollectionViewCellViewModelProtocol.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 11.05.2023.
//

import Foundation

protocol OurPartnersCollectionViewCellViewModelProtocol {
    var imageString: String? { get }
    var link: String? { get }
    init(partner: Partner)
    
}
