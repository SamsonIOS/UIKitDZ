//
//  RegistrationViewController.swift
//  UIKitDZ
//
//  Created by coder on 04.10.2022.
//

import UIKit
/// Структура для наших ключей
struct KeysDefaults {
    static let keyPhone = "phone"
    static let keyLogin = "login"
    static let keyPassword = "password"
    static let keyRePassword = "rePassword"
    static let keyEmail = "email"
}

/// Экран с регистрацией
class RegistrationViewController: UIViewController {
    
    // MARK: @IBOutlet properties
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var loginUserTextField: UITextField!
    @IBOutlet weak var psswordUserTextField: UITextField!
    @IBOutlet weak var rePasswordUserTextField: UITextField!
    @IBOutlet weak var emailUserTextField: UITextField!
    @IBOutlet weak var registrationButton: UIButton!
    
    let defaults = UserDefaults.standard
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateTextField()
        
    }
    
    // MARK: Methods
    
    func delegateTextField() {
        phoneTextField.delegate = self
        loginUserTextField.delegate = self
        psswordUserTextField.delegate = self
        rePasswordUserTextField.delegate = self
        emailUserTextField.delegate = self
    }
    
    // MARK: @IBAction
    @IBAction func registrationButtonAction(_ sender: Any) {
        
        let phone = phoneTextField.text ?? ""
        let login = loginUserTextField.text ?? ""
        let password = psswordUserTextField.text ?? ""
        let rePassword = rePasswordUserTextField.text ?? ""
        let email = emailUserTextField.text ?? ""
        
        if !phone.isEmpty && !login.isEmpty && !password.isEmpty && !rePassword.isEmpty && !email.isEmpty {
            print("hello")
            defaults.set(phone, forKey: KeysDefaults.keyPhone)
            defaults.set(login, forKey: KeysDefaults.keyLogin)
            defaults.set(password, forKey: KeysDefaults.keyPassword)
            defaults.set(rePassword, forKey: KeysDefaults.keyRePassword)
            defaults.set(email, forKey: KeysDefaults.keyEmail)
        }
        dismiss(animated: true)
    }
}

// MARK: UITextFieldDelegate
extension RegistrationViewController: UITextFieldDelegate {
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case phoneTextField:
            loginUserTextField.becomeFirstResponder()
        case loginUserTextField:
            psswordUserTextField.becomeFirstResponder()
        case psswordUserTextField:
            rePasswordUserTextField.becomeFirstResponder()
        case rePasswordUserTextField:
            emailUserTextField.becomeFirstResponder()
        default:
            emailUserTextField.resignFirstResponder()
        }
    }
    
    private func tagBasedTextField(_ textField: UITextField) {
        let nextTextFieldTag = textField.tag + 1
        
        if let nextTextField = textField.superview?.viewWithTag(nextTextFieldTag) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
    }
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool {
            return true
        }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchBasedNextTextField(textField)
        return true
    }
}
