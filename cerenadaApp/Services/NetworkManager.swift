//
//  NetworkManager.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 27.04.2023.
//

import UIKit
import Alamofire


class NetworkManager {

    static let shared = NetworkManager()
    
    func request(completion: @escaping(_ products: [Product]) -> ()) {
        
        let parameters = ["category": 2215]
        
        let url = "https://cerenada.ru/wp-json/wc/v3/products?&consumer_key=ck_92c8b3a8dad21a0c0c63ca32162d1de98741e8b7&consumer_secret=cs_50ddecfd1e1624327a381add4d7fb7b7464b98ae&per_page=100&category=&status=publish"
        
        AF.request(url, parameters: parameters).response { responce in
            switch responce.result {
            case .success(let data) :
                do {
                    let jsonData = try JSONDecoder().decode([Product].self, from: data!)
                    completion(jsonData)
                } catch {
                    print("MatchesParseError")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
}

