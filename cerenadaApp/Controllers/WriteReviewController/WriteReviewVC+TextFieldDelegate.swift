//
//  WriteReviewVC+TextFieldDelegate.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 20.02.2023.
//

import UIKit

extension WriteReviewViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}


extension WriteReviewViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
         if(text == "\n") {
             textView.resignFirstResponder()
             return false
         }
         return true
     }
    
}
