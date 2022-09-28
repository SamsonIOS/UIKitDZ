//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// SignInViewController - Экран с входом в личный кабинет
class SignInViewController: UIViewController {

    let logoFood: UIImageView = {
        var logo = UIImageView(frame: CGRect(
            x: 0,
            y: 150,
            width: 350,
            height: 300))
        logo.image = UIImage(named: "foodLogo")
        return logo
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingViewController()
    }
    func settingViewController() {
        logoFood.center.x = view.center.x
        view.addSubview(logoFood)
    }
    func settingsLabelsAndTextField() {
        
    }
}
