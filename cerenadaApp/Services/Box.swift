//
//  Box.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 03.05.2023.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> ()
    
    var value: T {
        didSet{
            listener?(value)
        }
    }
    
    var listener: Listener?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
}
