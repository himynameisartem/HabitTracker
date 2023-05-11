//
//  PreviewCollectionViewModelProtocol.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 09.05.2023.
//

import Foundation

protocol PreviewCollectionViewModelProtocol {
    var imageString: String { get }
    init(string: String)
}
