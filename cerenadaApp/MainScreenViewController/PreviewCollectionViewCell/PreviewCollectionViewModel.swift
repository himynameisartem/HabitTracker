//
//  PreviewCollectionViewModel.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 09.05.2023.
//

import Foundation

class PreviewCollectionViewModel: PreviewCollectionViewModelProtocol {
    
    var imageString: String
    
    required init(string: String) {
        self.imageString = string
    }
    
    
}
