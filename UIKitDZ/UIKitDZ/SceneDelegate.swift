//
//  SceneDelegate.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// Scene Delegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
            
            let firstVC = ViewController()
            let secondVC = SecondViewController()
            let tabBarVC = UITabBarController()
            tabBarVC.tabBar.backgroundColor = .systemGroupedBackground
            tabBarVC.tabBar.tintColor = .systemOrange
            let navFirstVC = UINavigationController(rootViewController: firstVC)
            let navSecondVC = UINavigationController(rootViewController: secondVC)
            navFirstVC.tabBarItem.image = UIImage(systemName: "eyes.inverse")
            navSecondVC.tabBarItem.image = UIImage(systemName: "hammer")
            tabBarVC.tabBar.unselectedItemTintColor = .systemBlue
            tabBarVC.tabBar.barTintColor = .green
            tabBarVC.setViewControllers([navFirstVC, navSecondVC], animated: true)
            window?.rootViewController = tabBarVC
            window?.makeKeyAndVisible()
           
    }
}
