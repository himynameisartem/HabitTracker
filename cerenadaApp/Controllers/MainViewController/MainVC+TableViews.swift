//
//  MainVC+TableViews.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 09.02.2023.
//

import UIKit
import Kingfisher
import MessageUI

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        infoArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = infoArray[section]
        
        if section.isOpened {
            return section.options.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoTableViewCell
        let sizeCell = tableView.dequeueReusableCell(withIdentifier: "sizeContainerCell", for: indexPath) as! SizeContainerTableViewCell
        let contactCell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell


            cell.awakeFromNib()
            cell.selectionStyle = .none
            sizeCell.awakeFromNib()
            sizeCell.selectionStyle = .none
                DispatchQueue.main.async {
            contactCell.awakeFromNib()
            contactCell.selectionStyle = .none
        }



        if indexPath.row == 0 {

            cell.imagePoint.isHidden = true
            cell.imageArrow.isHidden = false
            cell.infoOptionLabel.text = ""
            cell.infoLabel.text = infoArray[indexPath.section].title

        } else {

            cell.imagePoint.isHidden = false
            cell.imageArrow.isHidden = true
            cell.infoLabel.text = ""
            cell.infoOptionLabel.text = infoArray[indexPath.section].options[indexPath.row - 1]

            if indexPath.section == 8 {
                sizeCell.infoOptionLabel.text = infoArray[indexPath.section].options[indexPath.row - 1]
                return sizeCell
            }

            if indexPath.section == 12 {

                DispatchQueue.main.async {
                    contactCell.infoOptionLabel.text = infoArray[indexPath.section].options[indexPath.row - 1]
                }
                
                contactCell.contactButton.addTarget(self, action: #selector(contactButtonTapped), for: .touchUpInside)
                contactCell.contactButton.tag = indexPath.row

                if indexPath.row == 1 {

                    contactCell.contactButton.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                    contactCell.contactButton.setImage(UIImage(systemName: "envelope"), for: .normal)
                    contactCell.contactButton.setTitle("  ivrosinvest@mail.ru  ", for: .normal)
                    contactCell.contactButton.titleLabel?.adjustsFontSizeToFitWidth = true
                    contactCell.contactButton.titleLabel?.minimumScaleFactor = 0.5
                    contactCell.contactButton.setTitleColor(.black, for: .normal)
                    contactCell.contactButton.isHidden = false


                } else if indexPath.row == 2 {

                    contactCell.contactButton.tintColor = #colorLiteral(red: 0, green: 0.6783743501, blue: 0, alpha: 1)
                    contactCell.contactButton.setImage(UIImage(systemName: "phone.fill"), for: .normal)
                    contactCell.contactButton.setTitle("  +7(920)369-44-84  ", for: .normal)
                    contactCell.contactButton.titleLabel?.adjustsFontSizeToFitWidth = true
                    contactCell.contactButton.titleLabel?.minimumScaleFactor = 0.5
                    contactCell.contactButton.setTitleColor(.black, for: .normal)
                    contactCell.contactButton.isHidden = false


                } else {

                    contactCell.contactButton.isHidden = true
                    
                }
            return contactCell

            }
        }

        if infoArray[indexPath.section].isOpened {

            cell.imageArrow.image = UIImage(systemName: "chevron.up")

        } else {

            cell.imageArrow.image = UIImage(systemName: "chevron.down")

        }
                
        return cell
    }
    
    @objc func contactButtonTapped(sender: UIButton) {
        let buttonTag = sender.tag
        if buttonTag == 1 {
            sender.showAnimation {
                
                let mailComposeViewController = self.configurateMailComposer()
                
                if MFMailComposeViewController.canSendMail() {
                    self.present(mailComposeViewController, animated: true)
                } else {
                    print("Нет доступа к iCloud")
                }                
            }
        } else if buttonTag == 2 {
            
            sender.showAnimation {
                    guard let url = URL(string: "telprompt://+7(920)369-44-84"),
                            UIApplication.shared.canOpenURL(url) else {
                            return
                        }
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            infoArray[indexPath.section].isOpened = !infoArray[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        }
    }
}
