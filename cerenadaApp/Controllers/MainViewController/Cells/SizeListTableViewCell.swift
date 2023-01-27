//
//  SizeListTableViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 27.01.2023.
//

import UIKit

class SizeListTableViewCell: UITableViewCell {
    
    let rusLabelOptions: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 11)
        label.textAlignment = .center
        return label
    }()
    
    let usaLabelOptions: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 11)
        label.textAlignment = .center
        return label
    }()
    
    let europeLabelOptions: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 11)
        label.textAlignment = .center
        return label
    }()
    
    let bustLabelOptions: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 11)
        label.textAlignment = .center
        return label
    }()
    
    let waistLabelOptions: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 11)
        label.textAlignment = .center
        return label
    }()
    
    let hipsLabelOptions: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 11)
        label.textAlignment = .center
        return label
    }()
    
    let sizeOptionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(sizeOptionsStackView)
        sizeOptionsStackView.addArrangedSubview(rusLabelOptions)
        sizeOptionsStackView.addArrangedSubview(usaLabelOptions)
        sizeOptionsStackView.addArrangedSubview(europeLabelOptions)
        sizeOptionsStackView.addArrangedSubview(bustLabelOptions)
        sizeOptionsStackView.addArrangedSubview(waistLabelOptions)
        sizeOptionsStackView.addArrangedSubview(hipsLabelOptions)
        
        makeConstraints()
        
    }
    
    func makeConstraints() {
        
        NSLayoutConstraint.activate([
            sizeOptionsStackView.topAnchor.constraint(equalTo: topAnchor),
            sizeOptionsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sizeOptionsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            sizeOptionsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
    
}
