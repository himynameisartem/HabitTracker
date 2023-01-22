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
        label.font = UIFont(name: "Helvetica-Bold", size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    let infoOptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 12)
        label.numberOfLines = 0
        return label
    }()
    
    let point: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        
        addSubview(infoLabel)
        addSubview(infoOptionLabel)
        addSubview(imagePoint)
        
       makeLabelConstraints()
        
    }
    
    func makeLabelConstraints() {

        NSLayoutConstraint.activate([
        
            infoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            infoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            infoOptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            infoOptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            infoOptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            infoOptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            imagePoint.centerYAnchor.constraint(equalTo: infoOptionLabel.centerYAnchor),
            imagePoint.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imagePoint.widthAnchor.constraint(equalToConstant: 10),
            imagePoint.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
}
