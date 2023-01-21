//
//  CategoryManager.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 25.10.2022.
//

import UIKit
import Alamofire

protocol NewProductManagerDelegate {
    func updateInterface(_: NetworkClient, with data: [ProductCardData])
}

class NetworkClient {
    
    var delegate: NewProductManagerDelegate?

func request() {
    
    let url = "https://cerenada.ru/wp-json/wc/v3/products?consumer_key=ck_92c8b3a8dad21a0c0c63ca32162d1de98741e8b7&consumer_secret=cs_50ddecfd1e1624327a381add4d7fb7b7464b98ae&per_page=100&category=2215&status=publish"
    
    AF.request(url).response { responce in
        switch responce.result {
        case .success(let data) :
            do {
                let jsonData = try JSONDecoder().decode([ProductCardData].self, from: data!)
                self.delegate?.updateInterface(self, with: jsonData)
//                print(jsonData)
            } catch {
                print("MatchesParseError")
            }
        case .failure(let error):
            print(error.localizedDescription)
            
        }
    }
    
}

}
