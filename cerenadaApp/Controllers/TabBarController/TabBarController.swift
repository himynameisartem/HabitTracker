//
//  TabBarController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 11.03.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
    
    private func generateTabBar() {
        let navVC = UINavigationController()
        navVC.viewControllers = [MainViewController()]
        
        viewControllers = [generateViewControllers(viewController: navVC,
                                                   title: "Главная",
                                                   image: UIImage(systemName: "house")),
//                           generateViewControllers(viewController: <#T##UIViewController#>, title: <#T##String#>, image: <#T##UIImage?#>),
//                           generateViewControllers(viewController: <#T##UIViewController#>, title: <#T##String#>, image: <#T##UIImage?#>),
//                           generateViewControllers(viewController: <#T##UIViewController#>, title: <#T##String#>, image: <#T##UIImage?#>),
//                           generateViewControllers(viewController: <#T##UIViewController#>, title: <#T##String#>, image: <#T##UIImage?#>)
        ]
    }
    
    private func generateViewControllers(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        
        return viewController
    }
}
