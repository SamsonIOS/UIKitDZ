//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// ViewController - экран со входом в приложение
class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        signInButton.layer.cornerRadius = 17
    }
    @IBAction func signInAction(_ sender: UIButton) {
        let email = "sc@ya.ru"
        let pass = "123"
        if emailTextField.text == email && passwordTextField.text == pass {
            let storyboard = UIStoryboard(
                name: "Main",
                bundle: nil)
            guard let newVC = storyboard.instantiateViewController(
                withIdentifier: "vc2"
            ) as? ViewControllerSecondSubClass else { return }
            self.present(newVC, animated: true)
        }
    }
}
