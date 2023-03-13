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
        setTabBarAppearance()
        
    }
    
    private func generateTabBar() {
        let mainNavVC = UINavigationController()
        mainNavVC.viewControllers = [MainViewController()]
        let categoriesNavVC = UINavigationController()
        categoriesNavVC.viewControllers = [CategoriesViewController()]
        
        viewControllers = [generateViewControllers(viewController: mainNavVC,
                                                   title: "Главная",
                                                   image: UIImage(systemName: "house")),
                           generateViewControllers(viewController: categoriesNavVC,
                                                   title: "Каталог",
                                                   image: UIImage(systemName: "text.magnifyingglass")),
                           generateViewControllers(viewController: CartViewController(),
                                                   title: "Корзина", image: UIImage(systemName: "bag")),
                           generateViewControllers(viewController: FavouritesViewController(),
                                                   title: "Избранное",
                                                   image: UIImage(systemName: "heart")),
                           generateViewControllers(viewController: UserProfileViewController(),
                                                   title: "Профиль",
                                                   image: UIImage(systemName: "person"))
        ]
    }
    
    private func generateViewControllers(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        
        return viewController
    }
    
    private func setTabBarAppearance() {
        
        tabBar.backgroundColor = .systemGray6
        tabBar.tintColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 0.8902369619)
    }
}
