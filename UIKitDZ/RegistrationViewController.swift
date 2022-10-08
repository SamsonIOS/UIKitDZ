//
//  RegistrationViewController.swift
//  UIKitDZ
//
//  Created by coder on 04.10.2022.
//

import UIKit

/// Экран с регистрацией
class RegistrationViewController: UIViewController {
    
    private enum Constants {
        static let emptyText = ""
    }
    
    // MARK: @IBOutlet properties
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var loginUserTextField: UITextField!
    @IBOutlet weak var passwordUserTextField: UITextField!
    @IBOutlet weak var rePasswordUserTextField: UITextField!
    @IBOutlet weak var emailUserTextField: UITextField!
    @IBOutlet weak var registrationButton: UIButton!
    
    let defaults = UserDefaults.standard
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateTextField()
        createNotificationCenter()
        
    }
    
    // MARK: Methods
    
    func delegateTextField() {
        passwordUserTextField.delegate = self
        emailUserTextField.delegate = self
    }
    
    // MARK: @IBAction
    @IBAction func registrationButtonAction(_ sender: Any) {
        let email = emailUserTextField.text ?? Constants.emptyText
        let password = passwordUserTextField.text ?? Constants.emptyText
        
        guard InfoUser.info.userDataMap[emailUserTextField.text ?? ""] != nil else {

            InfoUser.info.userDataMap[email] = password
            UserDefaults.standard.set(InfoUser.info.userDataMap, forKey: "userData")
            dismiss(animated: true)
            return
        }
        
        let alertController = UIAlertController(
            title: "Ошибка",
            message: "Такая почта уже существует",
            preferredStyle: .alert)
        let alertControllerAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(alertControllerAction)
        present(alertController, animated: true)
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
    }
}

// MARK: UITextFieldDelegate
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
