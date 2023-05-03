//
//  ContainerTableViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 03.05.2023.
//

import UIKit

class ContainerTableViewCell: UITableViewCell {
    
    private let infoLabel = UILabel()
    private let imagePoint = UIImageView()
    private let russianSizeLabel = UILabel()
    private let usaSizeLabel = UILabel()
    private let europeanSizeLabel = UILabel()
    private let bustLabel = UILabel()
    private let waistLabel = UILabel()
    private let hipsLabel = UILabel()
    private let sizeLabelsStackView = UIStackView()
    private let sizeListTableView = UITableView()
    private var viewModel: MainScreenViewModelProtocol!
    var indexPath: IndexPath?
    
    var containerViewModel: InformationTableViewCellViewModelProtocol! {
        didSet {
            guard let indexPath = indexPath else { return }
            infoLabel.text = containerViewModel.options?[indexPath.row - 1]
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        viewModel = MainScreenViewModel()
        
        setupUI()
        setupStyle()
        setupConstraints()
    }
    
    func setupUI() {
        addSubview(infoLabel)
        addSubview(imagePoint)
        addSubview(sizeLabelsStackView)
        
        sizeLabelsStackView.addArrangedSubview(russianSizeLabel)
        sizeLabelsStackView.addArrangedSubview(usaSizeLabel)
        sizeLabelsStackView.addArrangedSubview(europeanSizeLabel)
        sizeLabelsStackView.addArrangedSubview(bustLabel)
        sizeLabelsStackView.addArrangedSubview(waistLabel)
        sizeLabelsStackView.addArrangedSubview(hipsLabel)
        
        addSubview(sizeListTableView)
        
        sizeListTableView.delegate = self
        sizeListTableView.dataSource = self
    }
    
    func setupStyle() {
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.font = UIFont(name: "Helvetica", size: 12)
        infoLabel.numberOfLines = 0
        
        imagePoint.translatesAutoresizingMaskIntoConstraints = false
        imagePoint.image = UIImage(systemName: "circle.fill")
        imagePoint.tintColor = .black
        
        settingSizeLabels(label: russianSizeLabel, name: "RU")
        settingSizeLabels(label: usaSizeLabel, name: "US")
        settingSizeLabels(label: europeanSizeLabel, name: "EU")
        settingSizeLabels(label: bustLabel, name: "Грудь")
        settingSizeLabels(label: waistLabel, name: "Талия")
        settingSizeLabels(label: hipsLabel, name: "Бедра")
        
        sizeLabelsStackView.translatesAutoresizingMaskIntoConstraints = false
        sizeLabelsStackView.axis = .horizontal
        sizeLabelsStackView.distribution = .fillEqually
        
        sizeListTableView.translatesAutoresizingMaskIntoConstraints = false
        sizeListTableView.isScrollEnabled = false
        sizeListTableView.register(SizeTableViewCel.self, forCellReuseIdentifier: "sizeCell")
        sizeListTableView.rowHeight = 30
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            infoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            imagePoint.centerYAnchor.constraint(equalTo: infoLabel.centerYAnchor),
            imagePoint.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imagePoint.widthAnchor.constraint(equalToConstant: 10),
            imagePoint.heightAnchor.constraint(equalToConstant: 10),
            
            sizeLabelsStackView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20),
            sizeLabelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            sizeLabelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            sizeListTableView.topAnchor.constraint(equalTo: sizeLabelsStackView.bottomAnchor, constant: 10),
            sizeListTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            sizeListTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -10),
            sizeListTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            sizeListTableView.heightAnchor.constraint(equalToConstant: 400),
        ])

    }
    
    private func settingSizeLabels(label: UILabel, name: String) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-bold", size: 13)
        label.text = name
        label.textAlignment = .center
    }

}

extension ContainerTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sizeCell", for: indexPath) as! SizeTableViewCel
        let cellViewModel = viewModel.sizeCellViewModel()
        cell.awakeFromNib()
        cell.indexPath = indexPath
        cell.viewModel = cellViewModel
        
        return cell
    }
}
