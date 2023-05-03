//
//  InformationTableViewCellViewModelProtocol.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 30.04.2023.
//

import Foundation

protocol InformationTableViewCellViewModelProtocol {
    var title: String? { get }
    var options: [String]? { get }
    var arrowImageName: String? { get }
    init (information: Information)
}
