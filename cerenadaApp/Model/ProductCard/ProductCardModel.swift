//
//  ProductCardModel.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 01.12.2022.
//

import UIKit

struct ProductCard: Codable {
    let name: String
//    let description: String
//    let price: String
//    let images: [Images]
//    let attributes: [Attributes]
//    let meta_data: [MetaData]
}

struct Attributes: Codable {
    let name: String
    let options: [String]
}

struct MetaData: Codable {
    let id: Int
    let key: String
//    let value:
}


