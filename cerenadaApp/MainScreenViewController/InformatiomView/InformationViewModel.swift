//
//  InformationViewModel.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 29.04.2023.
//

import UIKit

class InformationViewModel: InformationViewModelProtocol {

    func informationViewFrame(frame: CGRect) -> CGRect {
        let height = CGFloat(13 * 40 + 120) < frame.height ? CGFloat(13 * 40 + 120) : frame.width * 1.5
        
        return CGRect(x: (frame.width - (frame.width / 1.11)) / 2,
                      y: -900,
                      width: frame.width / 1.11,
                      height: height)
    }
}
