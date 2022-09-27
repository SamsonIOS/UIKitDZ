//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// StartViewController - Первый экран
class StartViewController: UIViewController {
    let reminderBirhtdayLabel = UILabel()
    let emailLabel = UILabel()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let passwordLabel = UILabel()
    let textSignIn = UILabel()
    let textFaceId = UILabel()
    let switchFaceId = UISwitch()
    let buttonSign = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        
    }
    func configureViews() {
        settingsTextField()
        settingsLabels()
        settingsSwitch()
        createButton()
    }
    func settingsTextField() {
        emailTextField.frame = CGRect(x: 50, y: 370, width: 250, height: 30)
        emailTextField.placeholder = "Введите email"
        emailTextField.borderStyle = .roundedRect
        view.addSubview(emailTextField)
        
        passwordTextField.frame = CGRect(x: 50, y: 440, width: 250, height: 30)
        passwordTextField.placeholder = "Введите пароль"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        
    }
    func settingsLabels() {
        reminderBirhtdayLabel.text = "Birthday Reminder"
        reminderBirhtdayLabel.font = .boldSystemFont(ofSize: 20)
        reminderBirhtdayLabel.frame = CGRect(x: 0, y: 150, width: 200, height: 100)
        reminderBirhtdayLabel.center.x = view.center.x
        reminderBirhtdayLabel.textColor = .systemBlue
        view.addSubview(reminderBirhtdayLabel)
        
        textSignIn.text = "Sign In"
        textSignIn.font = .boldSystemFont(ofSize: 25)
        textSignIn.frame = CGRect(x: 50, y: 265, width: 100, height: 100)
        view.addSubview(textSignIn)
        
        emailLabel.text = "Email"
        emailLabel.font = .boldSystemFont(ofSize: 15)
        emailLabel.textColor = .systemBlue
        emailLabel.frame = CGRect(x: 50, y: 330, width: 50, height: 50)
        view.addSubview(emailLabel)
        
        passwordLabel.text = "Password"
        passwordLabel.font = .boldSystemFont(ofSize: 15)
        passwordLabel.textColor = .systemBlue
        passwordLabel.frame = CGRect(x: 50, y: 400, width: 120, height: 50)
        view.addSubview(passwordLabel)
        
        textFaceId.text = "Вход по Face ID"
        textFaceId.font = .boldSystemFont(ofSize: 15)
        textFaceId.frame = CGRect(x: 120, y: 470, width: 200, height: 100)
        view.addSubview(textFaceId)
    }
    func settingsSwitch() {
        switchFaceId.isOn = true
        switchFaceId.frame = CGRect(x: 260, y: 505, width: 0, height: 0)
        view.addSubview(switchFaceId)
    }
    func createButton() {
        buttonSign.addTarget(self, action: #selector(didTapButtonAction), for: .touchUpInside)
        buttonSign.setTitle("Войти", for: .normal)
        buttonSign.backgroundColor = .systemBlue
        buttonSign.frame = CGRect(x: 0, y: 580, width: 270, height: 50)
        buttonSign.center.x = view.center.x
        buttonSign.layer.cornerRadius = 15
        view.addSubview(buttonSign)
    }
    @objc private func didTapButtonAction() {
        let secondVC = UserViewController()
        let navigationVC = UINavigationController(rootViewController: secondVC)
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC, animated: true)
    }
}
