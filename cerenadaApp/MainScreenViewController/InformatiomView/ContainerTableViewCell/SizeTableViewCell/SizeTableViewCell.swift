//
//  SizeTableViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 03.05.2023.
//

import UIKit

class SizeTableViewCel: UITableViewCell {
    
    private let russianSizeLabel = UILabel()
    private let usaSizeLabel = UILabel()
    private let europeanSizeLabel = UILabel()
    private let bustLabel = UILabel()
    private let waistLabel = UILabel()
    private let hipsLabel = UILabel()
    private let sizeLabelsStackView = UIStackView()
    var indexPath: IndexPath?
    
    var viewModel: SizeTableViewCellViewModelProtocol! {
        didSet {
            guard let indexPath = self.indexPath else { return }
            self.russianSizeLabel.text = viewModel.russiaSize?[indexPath.row]
            self.usaSizeLabel.text = viewModel.usaSize?[indexPath.row]
            self.europeanSizeLabel.text = viewModel.europeanSize?[indexPath.row]
            self.bustLabel.text = viewModel.bust?[indexPath.row]
            self.waistLabel.text = viewModel.waist?[indexPath.row]
            self.hipsLabel.text = viewModel.hips?[indexPath.row]
        }
    }
    
    override func awakeFromNib() {
        super .awakeFromNib()
        
        setupUI()
        setupStyle()
        setupConstraints()
    }
    
    func setupUI() {
        addSubview(sizeLabelsStackView)
        sizeLabelsStackView.addArrangedSubview(russianSizeLabel)
        sizeLabelsStackView.addArrangedSubview(usaSizeLabel)
        sizeLabelsStackView.addArrangedSubview(europeanSizeLabel)
        sizeLabelsStackView.addArrangedSubview(bustLabel)
        sizeLabelsStackView.addArrangedSubview(waistLabel)
        sizeLabelsStackView.addArrangedSubview(hipsLabel)
    }
    
    func setupStyle() {
        let labels = [russianSizeLabel, usaSizeLabel, europeanSizeLabel, bustLabel, waistLabel, hipsLabel]
        setupLabels(labels: labels)
        
        sizeLabelsStackView.translatesAutoresizingMaskIntoConstraints = false
        sizeLabelsStackView.axis = .horizontal
        sizeLabelsStackView.distribution = .fillEqually
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            sizeLabelsStackView.topAnchor.constraint(equalTo: topAnchor),
            sizeLabelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sizeLabelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            sizeLabelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

    }
    
    private func setupLabels(labels: [UILabel]) {
        for i in labels {
            i.translatesAutoresizingMaskIntoConstraints = false
            i.font = UIFont(name: "Helvetica", size: 11)
            i.textAlignment = .center
        }
    }
}
