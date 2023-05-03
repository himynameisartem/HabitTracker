//
//  InformationTableViewCellViewModel.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 30.04.2023.
//

import Foundation

class InformationTableViewCellViewModel: InformationTableViewCellViewModelProtocol {
    
    
    private var information: Information
    
    var title: String? {
        return information.title
    }
    
    var options: [String]? {
        return information.options
    }
    var arrowImageName: String? {
        return information.isOpened ? "chevron.up" : "chevron.down"
    }
            
    required init(information: Information) {
        self.information = information
    }
}
