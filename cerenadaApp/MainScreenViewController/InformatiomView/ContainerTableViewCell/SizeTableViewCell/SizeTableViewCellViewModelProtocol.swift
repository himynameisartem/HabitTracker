//
//  SizeTableViewCellViewModelProtocol.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 03.05.2023.
//

import Foundation

protocol SizeTableViewCellViewModelProtocol {
    var russiaSize: [String]? { get }
    var usaSize: [String]? { get }
    var europeanSize: [String]? { get }
    var bust: [String]? { get }
    var waist: [String]? { get }
    var hips: [String]? { get }
    init(size: Size)
}
