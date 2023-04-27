//
//  CategoriesModel.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 05.04.2023.
//

import UIKit

struct Categories: Codable {
    let id: Int
    let name: String
    let description: String
    let parent: Int
}


