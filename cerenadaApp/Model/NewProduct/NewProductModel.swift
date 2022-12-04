//
//  NewProductModel.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 25.10.2022.
//

import UIKit

struct NewProductData: Codable {
    let id: Int
    let name: String
    let price: String
    let status: String
    let images: [Images]
}

struct Images: Codable {
    let src: String
}


let previewArray = ["preview1", "preview2", "preview3", "preview4", "preview5"]
