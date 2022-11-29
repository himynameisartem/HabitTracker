//
//  InfoTableViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 31.10.2022.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    let infoLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let arrow: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .black
        return image
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
//        makeConstraints()
    }
    
    func makeLabelConstraints() {
        
//        addSubview(infoLabel)
//        addSubview(arrow)
        
        NSLayoutConstraint.activate([
        
            infoLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
        ])
    }
    
    func makeArrowConstraints() {
        NSLayoutConstraint.activate([
            
            arrow.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            arrow.widthAnchor.constraint(equalToConstant: 20)
            
        ])
    }
}
