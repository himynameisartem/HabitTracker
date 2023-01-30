//
//  ContactTableViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 28.01.2023.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    let infoOptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 12)
        label.numberOfLines = 0
        return label
    }()
    
    let contactButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 14)
        button.layer.cornerRadius = 5
        button.backgroundColor = .white
        button.makeShadow()
        return button
    }()
    
    let imagePoint: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .black
        return image
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(infoOptionLabel)
        addSubview(imagePoint)
        addSubview(contactButton)
                
        makeConstraints()
    }
    
    func makeConstraints() {
        
        NSLayoutConstraint.activate([
            
            
            contactButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            contactButton.leadingAnchor.constraint(equalTo: infoOptionLabel.trailingAnchor, constant: 10),
            contactButton.heightAnchor.constraint(equalToConstant: 25),
            contactButton.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20),

            infoOptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            infoOptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            infoOptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            infoOptionLabel.trailingAnchor.constraint(equalTo: contactButton.leadingAnchor, constant: -10),
            
            imagePoint.centerYAnchor.constraint(equalTo: infoOptionLabel.centerYAnchor),
            imagePoint.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imagePoint.widthAnchor.constraint(equalToConstant: 10),
            imagePoint.heightAnchor.constraint(equalToConstant: 10),
            
        ])
        
    }
    
}
