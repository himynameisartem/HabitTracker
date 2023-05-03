//
//  ContactsTableViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 03.05.2023.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    private let infoLabel = UILabel()
    private let contactButton = UIButton()
    private let imagePoint = UIImageView()
    var indexPath: IndexPath?
    
    var infoViewModel: InformationTableViewCellViewModelProtocol! {
        didSet {
            guard let indexPath = indexPath else { return }
            self.infoLabel.text = infoViewModel.options?[indexPath.row - 1]
        }
    }
    
    var viewModel: ContactsTableViewCellViewModelProtocol! {
        didSet {
            guard let indexPath = indexPath else { return }
            if indexPath.row == 1 {
                guard let email = viewModel.email else { return }
                self.contactButton.setTitle("  \(email)  ", for: .normal)
                self.contactButton.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                self.contactButton.setImage(UIImage(systemName: "envelope"), for: .normal)
                self.contactButton.titleLabel?.adjustsFontSizeToFitWidth = true
                self.contactButton.titleLabel?.minimumScaleFactor = 0.5
                self.contactButton.setTitleColor(.black, for: .normal)
                self.contactButton.addTarget(self, action: #selector(sendEmail), for: .touchDown)
            } else if indexPath.row == 2 {
                guard let phoneNumber = viewModel.phoneNumber else { return }
                self.contactButton.setTitle("  \(phoneNumber)  ", for: .normal)
                self.contactButton.tintColor = #colorLiteral(red: 0, green: 0.6783743501, blue: 0, alpha: 1)
                self.contactButton.setImage(UIImage(systemName: "phone.fill"), for: .normal)
                self.contactButton.titleLabel?.adjustsFontSizeToFitWidth = true
                self.contactButton.titleLabel?.minimumScaleFactor = 0.5
                self.contactButton.setTitleColor(.black, for: .normal)
                self.contactButton.addTarget(self, action: #selector(callPhone), for: .touchDown)
            } else {
                self.contactButton.isHidden = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        setupUI()
        setupStyle()
        setupConstraints()
    }
    
    func setupUI() {
        addSubview(infoLabel)
        addSubview(imagePoint)
        addSubview(contactButton)
    }
    
    func setupStyle() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.font = UIFont(name: "Helvetica", size: 12)
        infoLabel.numberOfLines = 0
        
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        contactButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 14)
        contactButton.layer.cornerRadius = 5
        contactButton.backgroundColor = .white
        contactButton.makeShadow()
        
        imagePoint.translatesAutoresizingMaskIntoConstraints = false
        imagePoint.image = UIImage(systemName: "circle.fill")
        imagePoint.tintColor = .black
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            contactButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            contactButton.leadingAnchor.constraint(equalTo: infoLabel.trailingAnchor, constant: 10),
            contactButton.heightAnchor.constraint(equalToConstant: 25),
            contactButton.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20),

            infoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            infoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            infoLabel.trailingAnchor.constraint(equalTo: contactButton.leadingAnchor, constant: -10),
            
            imagePoint.centerYAnchor.constraint(equalTo: infoLabel.centerYAnchor),
            imagePoint.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imagePoint.widthAnchor.constraint(equalToConstant: 10),
            imagePoint.heightAnchor.constraint(equalToConstant: 10),
            
        ])
    }
    
    @objc func sendEmail(sender: UIButton) {
        sender.showAnimation {
            print("sendEmail")
        }
    }
    
    @objc func callPhone(sender: UIButton) {
        sender.showAnimation {
            print("callPhone")
        }
    }
}
