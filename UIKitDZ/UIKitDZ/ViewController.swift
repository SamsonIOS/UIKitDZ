//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// Начальний VC
class ViewController: UIViewController {
    let sayHello = SayHello()
    let bigButton = UIButton()
    let labelBigButton = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        bigButtonSettings()
        labelBigButtonSettings()
        bigButton.addTarget(self, action: #selector(actionForBigButton(sender: )), for: .touchUpInside)
    }
    func labelBigButtonSettings() {
        labelBigButton.numberOfLines = 0
        labelBigButton.textColor = .white
        labelBigButton.font = .systemFont(ofSize: 20)
        labelBigButton.frame = CGRect(x: 160, y: 170, width: 120, height: 200)
        view.addSubview(labelBigButton)
    }
    
    func bigButtonSettings() {
        bigButton.setTitle("Начать", for: .normal)
        bigButton.titleLabel?.textColor = .black
        bigButton.backgroundColor = .lightGray
        bigButton.frame = CGRect(x: 70, y: 350, width: 250, height: 100)
        bigButton.layer.cornerRadius = 30
        view.addSubview(bigButton)
    }
    @objc func actionForBigButton(sender: UIButton) {
        let alertForBigButton = UIAlertController(
            title: "Внимание",
            message: "введите слово",
            preferredStyle: .alert)
        
        let actionForBigButton = UIAlertAction(
            title: "OK",
            style: .default) { _ in
                
                let textField = alertForBigButton.textFields?.first?.text ?? "nil"
                self.labelBigButton.text = "ваше слово: \(textField)"
                if textField == "leohl" {
                    self.labelBigButton.text = self.sayHello.hello
                } else {
                    self.labelBigButton.text = textField
                }
            }
        
        alertForBigButton.addTextField()
        alertForBigButton.addAction(actionForBigButton)
        present(alertForBigButton, animated: true)
    }
}
