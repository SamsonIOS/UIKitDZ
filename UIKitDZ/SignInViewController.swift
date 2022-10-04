//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// Начальний VC
class SignInViewController: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signInAction(_ sender: Any) {
        if emailTextField.text == defaults.string(forKey: KeysDefaults.keyLogin) {
            
        } else {
            let alertController = UIAlertController(
                title: "Ошибка", message: "Зарегистрируйтесь или войдите", preferredStyle: .alert)
            let alerControllActiom = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(alerControllActiom)
            present(alertController, animated: true)
        }
    }
    
}
