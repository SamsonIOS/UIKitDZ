//
//  RegistrationViewController.swift
//  UIKitDZ
//
//  Created by coder on 04.10.2022.
//

import UIKit

/// Экран с регистрацией пользователя
final class RegistrationViewController: UIViewController {
    
    // MARK: Constants
    private enum Constants {
        static let emptyText = ""
        static let defaults = UserDefaults.standard
    }
    
    // MARK: @IBOutlet properties
    @IBOutlet private weak var phoneTextField: UITextField!
    @IBOutlet private weak var loginUserTextField: UITextField!
    @IBOutlet private weak var passwordUserTextField: UITextField!
    @IBOutlet private weak var rePasswordUserTextField: UITextField!
    @IBOutlet private weak var emailUserTextField: UITextField!
    @IBOutlet private weak var registrationButton: UIButton!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateTextField()
        createNotificationCenter()
    }
    
    // MARK: @IBAction private action
    @IBAction private func registrationButtonAction(_ sender: Any) {
        let email = emailUserTextField.text ?? Constants.emptyText
        let password = passwordUserTextField.text ?? Constants.emptyText
        
        guard InfoUser.info.userDataMap[emailUserTextField.text ?? ""] != nil else {
            tapOkButton(title: nil, message: "Вы успешно зарегистрированы") {
                InfoUser.info.userDataMap[email] = password
                Constants.defaults.set(InfoUser.info.userDataMap, forKey: "userData")
                self.dismiss(animated: true)
            }
            return
        }
        
        tapOkButton(title: "Ошибка", message: "Такая почта уже существует", handler: nil)
    }
    
    // MARK: Private Methods
    private func delegateTextField() {
        passwordUserTextField.delegate = self
        emailUserTextField.delegate = self
        phoneTextField.delegate = self
        rePasswordUserTextField.delegate = self
        loginUserTextField.delegate = self
        passwordUserTextField.isSecureTextEntry = true
        rePasswordUserTextField.isSecureTextEntry = true
    }
    
    private func createNotificationCenter() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: nil) { _ in
                self.view.frame.origin.y = -80
            }
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: nil) { _ in
                self.view.frame.origin.y = 0
            }
        
        registrationButton.layer.cornerRadius = 15
        registrationButton.clipsToBounds = true
    }
}

// MARK: Extension - UIViewController + AlertController
extension UIViewController {
    typealias Closure = (() -> ())?
    func tapOkButton(title: String?, message: String, handler: Closure) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertControllerAction = UIAlertAction(title: "OK", style: .default) { _ in
            handler?()
        }
        alertController.addAction(alertControllerAction)
        present(alertController, animated: true)
    }
}

// MARK: Extension - RegistrationViewController + UITextFieldDelegate
extension RegistrationViewController: UITextFieldDelegate {
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case phoneTextField:
            loginUserTextField.becomeFirstResponder()
        case loginUserTextField:
            passwordUserTextField.becomeFirstResponder()
        case passwordUserTextField:
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
