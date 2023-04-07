//
//  CategoriesManager.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 05.04.2023.
//

import UIKit
import Alamofire

protocol CategoriesManagerDelegate {
    func updateInterface(_: CategoriesClient, with data: [Categories])
}

class CategoriesClient {
    
    var delegate: CategoriesManagerDelegate?
    
    func request() {
        
        let url = "https://cerenada.ru/wp-json/wc/v3/products/categories/?per_page=100&consumer_key=ck_92c8b3a8dad21a0c0c63ca32162d1de98741e8b7&consumer_secret=cs_50ddecfd1e1624327a381add4d7fb7b7464b98ae"
        
        AF.request(url).response { responce in
            switch responce.result {
            case .success(let data) :
                do {
                    let jsonData = try JSONDecoder().decode([Categories].self, from: data!)
                    self.delegate?.updateInterface(self, with: jsonData)
                    
                    
                } catch {
                    print("MatchesParseError")
                }
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
}
