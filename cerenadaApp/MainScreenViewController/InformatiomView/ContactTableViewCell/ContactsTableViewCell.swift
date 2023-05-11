//
//  ContactsTableViewCell.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 03.05.2023.
//

import UIKit
import MessageUI

class ContactsTableViewCell: UITableViewCell {
    
    private let mailComposeVC = MFMailComposeViewController()
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
                buttonSetting(button: self.contactButton,
                              title: email,
                              color: Color.shared.mailButtonColor,
                              imageSystemName: "envelope")
                self.contactButton.addTarget(self, action: #selector(sendMail), for: .touchDown)
                
            } else if indexPath.row == 2 {
                
                guard let phoneNumber = viewModel.phoneNumber else { return }
                buttonSetting(button: self.contactButton,
                              title: phoneNumber,
                              color: Color.shared.phoneButtonColor,
                              imageSystemName: "phone.fill")
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
        contactButton.titleLabel?.adjustsFontSizeToFitWidth = true
        contactButton.titleLabel?.minimumScaleFactor = 0.5
        contactButton.setTitleColor(.black, for: .normal)
        contactButton.makeShadow()
        
        imagePoint.translatesAutoresizingMaskIntoConstraints = false
        imagePoint.image = UIImage(systemName: "circle.fill")
        imagePoint.tintColor = .black
        
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients([contactsData.email])
        mailComposeVC.setSubject("")
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
    
    private func buttonSetting(button: UIButton, title: String, color: UIColor, imageSystemName: String) {
        button.setTitle("  \(title)  ", for: .normal)
        button.tintColor = color
        button.setImage(UIImage(systemName: imageSystemName), for: .normal)
    }
    
    @objc private func sendMail(sender: UIButton) {
        sender.showAnimation {
            self.sendEmail(viewController: MainScreenViewController())
        }
    }
    
    @objc private func callPhone(sender: UIButton) {
        sender.showAnimation {
            CallPhone.shared.callPhone(with: contactsData.phoneNumber)
        }
    }
}

//MARK: -MFMailComposeViewControllerDelegate

extension ContactsTableViewCell: MFMailComposeViewControllerDelegate {
        
    private func sendEmail(viewController: UIViewController) {
        let mailComposeViewController = mailComposeVC
        if MFMailComposeViewController.canSendMail() {
            viewController.present(mailComposeViewController, animated: true)
        } else {
            print("Нет доступа к iCloud")
        }
    }
}
