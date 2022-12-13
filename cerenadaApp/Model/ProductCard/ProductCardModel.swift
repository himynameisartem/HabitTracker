//
//  ProductCardModel.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 01.12.2022.
//

import UIKit

struct ProductCard: Codable {
    let name: String
    let description: String
    let sku: String
    let price: String
    let images: [Images]
    let attributes: [Attributes]
}

struct Attributes: Codable {
    let name: String
    let options: [String]
}

