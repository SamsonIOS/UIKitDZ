//
//  SceneDelegate.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// Scene Delegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Public properties
    
    var window: UIWindow?
    
    // MARK: - Private properties
    
    private let signInViewController = SignInViewController()
    
    // MARK: - Public methods
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.backgroundColor = .white
        window?.rootViewController = signInViewController
        window?.makeKeyAndVisible()
    }
}
