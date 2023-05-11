//
//  CallPhone.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 04.05.2023.
//

import UIKit

class CallPhone {
    
    static let shared = CallPhone()
    
    func callPhone(with phoneNumber: String) {
        guard let url = URL(string: "telprompt://\(phoneNumber)"),
              UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
