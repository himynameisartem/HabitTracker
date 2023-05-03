//
//  InformationTableViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 30.04.2023.
//

import UIKit

class InformationTableViewCell: UITableViewCell {
    
    private let infoLabel = UILabel()
    private let infoOptionLabel = UILabel()
    private let imagePoint = UIImageView()
    private let imageArrow = UIImageView()
    var indexPath: IndexPath?
    
    var sectionViewModel: InformationTableViewCellViewModelProtocol! {
        didSet {
            self.infoLabel.text = sectionViewModel.title
            self.infoOptionLabel.text = ""
            self.imagePoint.isHidden = true
            self.imageArrow.isHidden = false
            self.imageArrow.image = UIImage(systemName: sectionViewModel.arrowImageName ?? "")
        }
    }
    
    var rowViewModel: InformationTableViewCellViewModelProtocol! {
        didSet {
            self.infoLabel.text = ""
            guard let indexPath = indexPath else { return }
            self.infoOptionLabel.text = rowViewModel.options?[indexPath.row - 1]
            self.imagePoint.isHidden = false
            self.imageArrow.isHidden = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        setupUI()
        setupStyle()
        setupConstraint()
    }
    
    func setupUI() {
        addSubview(infoLabel)
        addSubview(infoOptionLabel)
        addSubview(imagePoint)
        addSubview(imageArrow)
    }
    
    func setupStyle() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.font = UIFont(name: "Helvetica-Bold", size: 14)
        infoLabel.numberOfLines = 0
        
        infoOptionLabel.translatesAutoresizingMaskIntoConstraints = false
        infoOptionLabel.font = UIFont(name: "Helvetica", size: 12)
        infoOptionLabel.numberOfLines = 0

        imagePoint.translatesAutoresizingMaskIntoConstraints = false
        imagePoint.image = UIImage(systemName: "circle.fill")
        imagePoint.tintColor = .black

        imageArrow.translatesAutoresizingMaskIntoConstraints = false
        imageArrow.tintColor = .systemGray2
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            infoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            imageArrow.centerYAnchor.constraint(equalTo: infoLabel.centerYAnchor),
            imageArrow.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageArrow.widthAnchor.constraint(equalToConstant: 20),
            imageArrow.heightAnchor.constraint(equalToConstant: 20),
            
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
