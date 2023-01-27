//
//  SizeContainerTableViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 27.01.2023.
//

import UIKit

class SizeContainerTableViewCell: UITableViewCell {
    
    let infoOptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 12)
        label.numberOfLines = 0
        return label
    }()
    
    let imagePoint: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .black
        return image
    }()
    
    let rusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-bold", size: 13)
        label.text = "RU"
        label.textAlignment = .center
        return label
    }()
    
    let usaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-bold", size: 13)
        label.text = "US"
        label.textAlignment = .center
        return label
    }()
    
    let europeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-bold", size: 13)
        label.text = "EU"
        label.textAlignment = .center
        return label
    }()
    
    let bustLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-bold", size: 13)
        label.text = "Грудь"
        label.textAlignment = .center
        return label
    }()
    
    let waistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-bold", size: 13)
        label.text = "Талия"
        label.textAlignment = .center
        return label
    }()
    
    let hipsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-bold", size: 13)
        label.text = "Бедра"
        label.textAlignment = .center
        return label
    }()
    
    let sizeLabelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let sizeListTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isScrollEnabled = false
        return table
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(infoOptionLabel)
        addSubview(imagePoint)
        addSubview(sizeLabelsStackView)
        
        sizeLabelsStackView.addArrangedSubview(rusLabel)
        sizeLabelsStackView.addArrangedSubview(usaLabel)
        sizeLabelsStackView.addArrangedSubview(europeLabel)
        sizeLabelsStackView.addArrangedSubview(bustLabel)
        sizeLabelsStackView.addArrangedSubview(waistLabel)
        sizeLabelsStackView.addArrangedSubview(hipsLabel)
        
        addSubview(sizeListTableView)
        
        sizeListTableView.delegate = self
        sizeListTableView.dataSource = self
        sizeListTableView.rowHeight = 30
        
        sizeListTableView.register(SizeListTableViewCell.self, forCellReuseIdentifier: "sizeCell")
        
        makeLabelConstraints()
    }
    
    func makeLabelConstraints() {
        
        NSLayoutConstraint.activate([
            
            infoOptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            infoOptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            infoOptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            imagePoint.centerYAnchor.constraint(equalTo: infoOptionLabel.centerYAnchor),
            imagePoint.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imagePoint.widthAnchor.constraint(equalToConstant: 10),
            imagePoint.heightAnchor.constraint(equalToConstant: 10),
            
            sizeLabelsStackView.topAnchor.constraint(equalTo: infoOptionLabel.bottomAnchor, constant: 20),
            sizeLabelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            sizeLabelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            sizeListTableView.topAnchor.constraint(equalTo: sizeLabelsStackView.bottomAnchor, constant: 10),
            sizeListTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            sizeListTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -10),
            sizeListTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            sizeListTableView.heightAnchor.constraint(equalToConstant: 400),
        ])
    }
}


extension SizeContainerTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sizeCell", for: indexPath) as! SizeListTableViewCell
        
        cell.awakeFromNib()
        
        cell.rusLabelOptions.text = sizeListArray.russiaSize[indexPath.row]
        cell.usaLabelOptions.text = sizeListArray.usaSize[indexPath.row]
        cell.europeLabelOptions.text = sizeListArray.europeSize[indexPath.row]
        cell.bustLabelOptions.text = sizeListArray.bust[indexPath.row]
        cell.waistLabelOptions.text = sizeListArray.waist[indexPath.row]
        cell.hipsLabelOptions.text = sizeListArray.hips[indexPath.row]
        
        return cell
    }
}
