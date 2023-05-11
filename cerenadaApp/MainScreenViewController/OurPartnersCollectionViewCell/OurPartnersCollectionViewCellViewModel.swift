//
//  OurPartnersCollectionViewCellViewModel.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 11.05.2023.
//

import Foundation

class OurPartnersCollectionViewCellViewModel: OurPartnersCollectionViewCellViewModelProtocol {
    let partner: Partner
    
    var imageString: String? {
        return partner.logoString
    }
    
    var link: String? {
        partner.link
    }
    
    required init(partner: Partner) {
        self.partner = partner
    }
}
