//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// SignViewController - экран входа/регистрации
class SignViewController: UIViewController {
    
    let emailTextField = UITextField()
    let passwordtextField = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTextFieldAndLabels()
    }
    func settingTextFieldAndLabels() {
        emailTextField.placeholder = "Имя пользователя/телефон"
        emailTextField.textColor = .systemGray
        emailTextField.frame = CGRect(x: 30, y: 100, width: 200, height: 40)
        emailTextField.borderStyle = .roundedRect
        view.addSubview(emailTextField)
    }
}
