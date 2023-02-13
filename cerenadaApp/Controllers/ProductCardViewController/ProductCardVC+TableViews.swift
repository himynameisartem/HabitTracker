//
//  ProductCardVC+TableViews.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 09.02.2023.
//

import UIKit

extension ProductCardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellsCounter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addToCardCell", for: indexPath) as! AddToCartTableViewCell
        
        cell.selectionStyle = .none
        cell.separatorInset = UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
                
        cell.sizeLabel.text = size[indexPath.row]
        cell.priceLabel.text = price + " ₽"
        
        cell.delegate = self
        cell.countOrderTextField.delegate = self
        addDoneButtonOnKeyboard(cell.countOrderTextField)
                        
        DispatchQueue.main.async {
            cell.awakeFromNib()
            cell.addToCartButton.addTarget(self, action: #selector(self.addToCart), for: .touchUpInside)
            cell.addToCartButton.tag = indexPath.row
        }

        return cell
    }
    
    @objc func addToCart(sender: UIButton) {
        let index = sender.tag
        
        sender.showAnimation {
            print(String(self.id) + "  " + self.size[index] + "  " + self.price)
        }
        
    }
    
}

extension ProductCardViewController: AddToCartDelegate {
    func textFieldChange(_ stepper: UIStepper, _ textField: UITextField) {
    }

    func stepper(_ stepper: UIStepper, at index: Int, didChangeValueTo newValue: Double) {
    }
}

