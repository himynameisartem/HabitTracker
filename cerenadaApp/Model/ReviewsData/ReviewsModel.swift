//
//  ReviewsModel.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 14.02.2023.
//

import UIKit

struct ReviewsData: Codable {
    
    let id: Int
    let date_created: String
    let status: String
    let reviewer: String
    let reviewer_email: String
    let review: String
    let rating: Int
    let reviewer_avatar_urls: UserPic
    
}

struct UserPic: Codable {
    
    let userPic24: String
    let userPic48: String
    let userPic96: String
        
        private enum CodingKeys : String, CodingKey {
                case userPic24 = "24", userPic48 = "48", userPic96 = "96"
            }
}
