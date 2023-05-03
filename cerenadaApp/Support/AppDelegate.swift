//
//  AppDelegate.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 06.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navVC = UINavigationController()
//        let vc = TabBarController()
        let vc = MainScreenViewController()
//        vc.selectedIndex = 0
        navVC.viewControllers = [vc]
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        
        return true
    }
}

