//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// SignViewController - экран входа/регистрации
class SignViewController: UIViewController {
    // MARK: Constants
    let mainVCImageView: UIImageView = {
        var mainPhoto = UIImageView(frame: CGRect(
            x: 0,
            y: 0,
            width: 0,
            height: 0))
        mainPhoto.image = UIImage(named: "photoMain")
        return mainPhoto
    }()
    
    let imageLogoClub: UIImageView = {
        var logo = UIImageView(frame: CGRect(
            x: 0,
            y: 25,
            width: 1000,
            height: 600))
        logo.image = UIImage(named: "cyberLogoNew")
        return logo
    }()
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let buttonSignIn = UIButton()
    let registrationButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTextFieldAndLabels()
    }
    // MARK: Settings Text Fields and Labels
    func settingTextFieldAndLabels() {
        mainVCImageView.frame.size.width = view.frame.size.width
        mainVCImageView.frame.size.height = view.frame.size.height
        view.addSubview(mainVCImageView)
        
        imageLogoClub.backgroundColor = .none
        imageLogoClub.center.x = view.center.x
        view.addSubview(imageLogoClub)
        
        emailTextField.placeholder = "Имя пользователя/телефон"
        emailTextField.backgroundColor = .systemGray
        emailTextField.frame = CGRect(x: 30, y: 450, width: 350, height: 50)
        emailTextField.borderStyle = .roundedRect
        view.addSubview(emailTextField)
        
        passwordTextField.placeholder = "Пароль"
        passwordTextField.backgroundColor = .systemGray
        passwordTextField.frame = CGRect(x: 30, y: 520, width: 350, height: 50)
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        
        buttonSignIn.setTitle("Войти", for: .normal)
        buttonSignIn.backgroundColor = .systemPurple
        buttonSignIn.frame = CGRect(x: 0, y: 620, width: 300, height: 50)
        buttonSignIn.center.x = view.center.x
        buttonSignIn.layer.cornerRadius = 15
        buttonSignIn.clipsToBounds = true
        buttonSignIn.addTarget(self, action: #selector(signInTapAction), for: .touchUpInside)
        view.addSubview(buttonSignIn)
        
        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.backgroundColor = .systemPurple
        registrationButton.frame = CGRect(x: 0, y: 700, width: 300, height: 50)
        registrationButton.center.x = view.center.x
        registrationButton.layer.cornerRadius = 15
        registrationButton.clipsToBounds = true
        view.addSubview(registrationButton)
    }
    @objc private func signInTapAction() {
        let secondView = InfoViewController()
        let navigationSecondView = UINavigationController(rootViewController: secondView)
        navigationSecondView.modalPresentationStyle = .fullScreen
        present(navigationSecondView, animated: true)
    }
}
