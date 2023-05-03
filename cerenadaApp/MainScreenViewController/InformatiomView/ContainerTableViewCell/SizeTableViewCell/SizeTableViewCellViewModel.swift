//
//  SizeTableViewCellViewModel.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 03.05.2023.
//

import Foundation

class SizeTableViewCellViewModel: SizeTableViewCellViewModelProtocol {
    
    private let size: Size
    
    var russiaSize: [String]? {
        return size.russiaSize
    }
    
    var usaSize: [String]? {
        return size.usaSize
    }
    
    var europeanSize: [String]? {
        return size.europeSize
    }
    
    var bust: [String]? {
        return size.bust
    }
    
    var waist: [String]? {
        return size.waist
    }
    
    var hips: [String]? {
        return size.hips
    }
    
    required init(size: Size) {
        self.size = size
    }
    
    
}
