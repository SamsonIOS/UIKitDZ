//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// Экран с входом в личный кабинет
final class SignInViewController: UIViewController {
    
    // MARK: Properties
    let logoFood: UIImageView = {
        var logo = UIImageView(frame: CGRect(
            x: 0,
            y: 130,
            width: 170,
            height: 170))
        logo.image = UIImage(named: "foodLogo")
        return logo
    }()
    
    let emailLabel = UILabel()
    let passwordLabel = UILabel()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signInButton = UIButton()
    let registrationButton = UIButton()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        settingViewController()
    }
    // MARK: Public Methods
    func settingViewController() {
        logoFood.center.x = view.center.x
        view.addSubview(logoFood)
        setTextField()
        setLabels()
        setButtons()
    }
    
    func setTextField() {
        emailTextField.placeholder = "Введите email"
        emailTextField.keyboardType = .numberPad
        emailTextField.frame = CGRect(x: 30, y: 390, width: 350, height: 35)
        emailTextField.borderStyle = .roundedRect
        view.addSubview(emailTextField)
        
        passwordTextField.placeholder = "Введите пароль"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.frame = CGRect(x: 30, y: 480, width: 350, height: 35)
        passwordTextField.borderStyle = .roundedRect
        view.addSubview(passwordTextField)
    }
    
    func setLabels() {
        emailLabel.text = "Email"
        emailLabel.frame = CGRect(x: 30, y: 350, width: 50, height: 50)
        emailLabel.textColor = .systemOrange
        emailLabel.font = .boldSystemFont(ofSize: 17)
        view.addSubview(emailLabel)
        
        passwordLabel.text = "Password"
        passwordLabel.frame = CGRect(x: 30, y: 440, width: 350, height: 50)
        passwordLabel.textColor = .systemOrange
        passwordLabel.font = .boldSystemFont(ofSize: 17)
        view.addSubview(passwordLabel)
        
    }
    
    func setButtons() {
        signInButton.setTitle("Войти", for: .normal)
        signInButton.backgroundColor = .systemOrange
        signInButton.frame = CGRect(x: 0, y: 570, width: 280, height: 50)
        signInButton.center.x = view.center.x
        signInButton.layer.cornerRadius = 15
        signInButton.clipsToBounds = true
        signInButton.addTarget(self, action: #selector(tapSignInButton), for: .touchUpInside)
        view.addSubview(signInButton)
        
        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.backgroundColor = .systemOrange
        registrationButton.frame = CGRect(x: 0, y: 650, width: 280, height: 50)
        registrationButton.center.x = view.center.x
        registrationButton.layer.cornerRadius = 15
        registrationButton.clipsToBounds = true
        view.addSubview(registrationButton)
        
    }

    // MARK: @Objc Action
    @objc private func tapSignInButton() {
        let foodViewController = FoodViewController()
        let navVC = UINavigationController(rootViewController: foodViewController)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}
