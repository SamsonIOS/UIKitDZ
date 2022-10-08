//
//  BaseTabBarController.swift
//  UIKitDZ
//
//  Created by coder on 08.10.2022.
//

import UIKit

/// Таб бар контроллер
class BaseTabBarController: UITabBarController {
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = .systemGroupedBackground
        
        viewControllers = [
            
            createController(viewController: TextViewController(), title: "Первый экран", imageName: "house"),
            createController(viewController: SecondViewController(), title: "Второй экран", imageName: "star")
        ]
    }
    
    // MARK: Private Methods
    private func createController(
        viewController: UIViewController, title: String, imageName: String) -> UIViewController {
            
            let navController = UINavigationController(rootViewController: viewController)
            
            navController.navigationBar.prefersLargeTitles = true
            viewController.navigationItem.title = title
            
            navController.tabBarItem.image = UIImage(systemName: imageName)
            
            return navController
        }
}
