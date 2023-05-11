//
//  ImageManager.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 27.04.2023.
//

import UIKit

class ImageManager {
    
    static let shared = ImageManager()
    
    func getImageData(from imageURL: String?, imageView: UIImageView, width: CGFloat ) {
        guard let stringURL = imageURL else { return }
        guard let imageURL = URL(string: stringURL) else { return }
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error {
                print("Error loading image data: \(error.localizedDescription)")
            } else if let data = data {
                DispatchQueue.main.async {
                    let compressData = UIImage(data: data)
                    guard let compressData = compressData else { return }
                    imageView.image = compressData.resizeWithWidth(width: width)
                }
            } else {
                print("Error loading image")
            }
        }.resume()
    }
}
