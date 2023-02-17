//
//  ProductCardVC+TextFieldDelegate.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 13.02.2023.
//

import UIKit

extension ProductCardViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 3
            let currentString = (textField.text ?? "") as NSString
            let newString = currentString.replacingCharacters(in: range, with: string)

            return newString.count <= maxLength
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.first == "0" {
            textField.text?.removeFirst()
            
            if textField.text?.first == "0" {
                textField.text?.removeFirst()
            }
            
                if textField.text?.first == "0" {
                    textField.text = ""
                    textField.placeholder = "-"
                }
            
            
        }
        productCounter = textField.text ?? "fail"
    }
    
    func addDoneButtonOnKeyboard(_ textField: UITextField) {
                
        let doneToolBar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolBar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(doneButtonAction))

        let items = [flexSpace, done]
        doneToolBar.items = items
        doneToolBar.sizeToFit()
     
        textField.inputAccessoryView = doneToolBar
    }
    
    @objc func doneButtonAction() {
        view.endEditing(true)
        
    }
}
