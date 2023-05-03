//
//  SafeAreaManager.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 29.04.2023.
//

import UIKit

class SafeAreaManager {
    
    static let shared = SafeAreaManager()
    
    func safeAreaInsets() -> UIEdgeInsets {
          if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }),
             let scene = window.windowScene {
              let statusBarHeight = scene.statusBarManager?.statusBarFrame.height ?? 0
              return UIEdgeInsets(top: statusBarHeight,
                                  left: 0,
                                  bottom: scene.screen.bounds.height - window.frame.maxY,
                                  right: 0)
          }
          return UIEdgeInsets.zero
      }
}

