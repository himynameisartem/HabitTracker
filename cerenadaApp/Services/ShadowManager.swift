//
//  ShadowManager.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 29.04.2023.
//

import UIKit

public extension UIView {
    
    func makeShadow() {
        self.layer.shadowColor = UIColor.systemGray2.cgColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 5
//        self.layer.shadowPath = UIBezierPath(rect: self.bounds ).cgPath
    }
    
}
