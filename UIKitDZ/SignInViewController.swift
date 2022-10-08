//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit

/// Начальний VC
final class SignInViewController: UIViewController {
    
    private enum Constants {
        static let emptyText = ""
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter()
        
    }
    
    @IBAction func signInAction(_ sender: Any) {
        
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
        
        let tabBarVC = BaseTabBarController()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let tabBarVCC = storyboard.instantiateViewController(
                    withIdentifier: "tabBarVC"
                ) as? BaseTabBarController else { return }
            
        tabBarVCC.modalPresentationStyle = .fullScreen
                present(tabBarVCC, animated: true)
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
