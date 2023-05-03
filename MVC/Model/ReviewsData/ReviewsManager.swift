//
//  ReviewsManager.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 14.02.2023.
//

import UIKit
import Alamofire

protocol ReviewsManagerDelegate {
    func update(_: ReviewClient, with data: [ReviewsData])
}

class ReviewClient {
    
    var delegate: ReviewsManagerDelegate?
    
    func request(productId: Int) {
        
        let url = "https://cerenada.ru/wp-json/wc/v3/products/reviews?consumer_key=ck_92c8b3a8dad21a0c0c63ca32162d1de98741e8b7&consumer_secret=cs_50ddecfd1e1624327a381add4d7fb7b7464b98ae&product=\(productId)"
        
        AF.request(url).response { responce in
            switch responce.result {
            case .success(let data) :
                do {
                    let jsonData = try JSONDecoder().decode([ReviewsData].self, from: data!)
                    self.delegate?.update(self, with: jsonData)
                } catch {
                    print("MatchesParseError")
                }
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
    }
    
}
