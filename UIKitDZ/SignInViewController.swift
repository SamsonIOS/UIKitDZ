//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit

/// Экран входа в приложение
final class SignInViewController: UIViewController {
    
    // MARK: @IBOutlet
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    
    // MARK: Private Components
    private enum Constants {
        static let emptyText = ""
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter()
        setButtons()
    }
    
    // MARK: @IBAction private Action
    @IBAction private func signInAction(_ sender: Any) {
        
        guard InfoUser.info.userDataMap[emailTextField.text ?? Constants.emptyText] == passwordTextField.text else {
            
            let alertController = UIAlertController(
                title: "Ошибка",
                message: "Почта/пароль wrong или зарегистрируйтесь",
                preferredStyle: .alert)
            
            let alertControllerAction = UIAlertAction(title: "OK", style: .cancel)
            
            alertController.addAction(alertControllerAction)
            present(alertController, animated: true)
            return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let tabBarVCC = storyboard.instantiateViewController(
            withIdentifier: "tabBarVC"
        ) as? BaseTabBarController else { return }
        
        tabBarVCC.modalPresentationStyle = .fullScreen
        present(tabBarVCC, animated: true)
    }
    
    // MARK: Private Methods
    private func setButtons() {
        signInButton.layer.cornerRadius = 15
        signInButton.clipsToBounds = true
        
        registrationButton.layer.cornerRadius = 15
        registrationButton.clipsToBounds = true
        
        passwordTextField.isSecureTextEntry = true
    }
    
    private func notificationCenter() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: nil) { _ in
                self.view.frame.origin.y = -190
            }
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: nil) { _ in
                self.view.frame.origin.y = 0
            }
    }
}
