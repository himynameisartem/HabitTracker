//
//  ReviewsCollectionViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 17.12.2022.
//

import UIKit

class ReviewsCollectionViewCell: UICollectionViewCell {
    
    let shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()
    
    let userPic: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let publishDataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rewiewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createViews()
            
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createViews() {
        
        addSubview(shadowView)
        shadowView.addSubview(userPic)
        shadowView.addSubview(userNameLabel)
        shadowView.addSubview(publishDataLabel)
        shadowView.addSubview(rewiewLabel)
        
        
        NSLayoutConstraint.activate([
        
            shadowView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            userPic.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 10),
            userPic.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 10),
            userPic.heightAnchor.constraint(equalToConstant: 40),
            userPic.widthAnchor.constraint(equalToConstant: 40),
            
            userNameLabel.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: userPic.trailingAnchor, constant: 10),
            
            publishDataLabel.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 10),
            publishDataLabel.leadingAnchor.constraint(equalTo: userNameLabel.trailingAnchor, constant: 20),
            
            rewiewLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 20),
            rewiewLabel.leadingAnchor.constraint(equalTo: userPic.trailingAnchor, constant: 20),
            rewiewLabel.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: 20),
            rewiewLabel.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: -20)
            
        ])
        
    }

    
}
