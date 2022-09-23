//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// View Controller - экран с двумя играми
class ViewController: UIViewController {

    let addictionButton = UIButton()
    let guessButton = UIButton()
    let sumLable = UILabel()
    let guessLabel = UILabel()
    let labelWelcome = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsFirstViewController()
        targetsForButtons()
        createButtons()
        createLabels()
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            createAlert()
        }
    func settingsFirstViewController() {
        self.view.backgroundColor = .gray
    }
    func targetsForButtons() {
        addictionButton.addTarget(self, action: #selector(actionButtonAction(sender: )), for: .touchUpInside)
        guessButton.addTarget(self, action: #selector(actionButtonGuess(sender: )), for: .touchUpInside)
    }
    func createAlert() {
        let alertFullName = UIAlertController(
            title: "Привет!",
            message: "Введите ваше ФИО",
            preferredStyle: .alert)
        let  alertActionFullName = UIAlertAction(title: "OK", style: .default) { _ in
            let textName = alertFullName.textFields?.first?.text ?? "nil"
            self.labelWelcome.text = "Hi! \(textName)"
        }
        alertFullName.addTextField()
        alertFullName.addAction(alertActionFullName)
        present(alertFullName, animated: true)
    }
    
    func createLabels() {
        sumLable.numberOfLines = 0
        sumLable.textColor = .white
        sumLable.font = .systemFont(ofSize: 20)
        sumLable.frame = CGRect(x: 0, y: 300, width: 240, height: 50)
        sumLable.center.x = view.center.x
        view.addSubview(sumLable)
        
        guessLabel.numberOfLines = 0
        guessLabel.textColor = .white
        guessLabel.font = .systemFont(ofSize: 20)
        guessLabel.frame = CGRect(x: 0, y: 520, width: 240, height: 50)
        guessLabel.center.x = view.center.x
        view.addSubview(guessLabel)
        
        labelWelcome.numberOfLines = 0
        labelWelcome.textColor = .white
        labelWelcome.font = .systemFont(ofSize: 18)
        labelWelcome.frame = CGRect(x: 0, y: 50, width: 200, height: 150)
        labelWelcome.center.x = self.view.center.x
        view.addSubview(labelWelcome)
    }
    
    func createButtons() {
        addictionButton.setTitle("Сложение", for: .normal)
        addictionButton.backgroundColor = .green
        addictionButton.layer.cornerRadius = 30
        addictionButton.frame = CGRect(x: 0, y: 190, width: 230, height: 100)
        addictionButton.center.x = view.center.x
        view.addSubview(addictionButton)
        
        guessButton.setTitle("Угадай число", for: .normal)
        guessButton.backgroundColor = .green
        guessButton.layer.cornerRadius = 30
        guessButton.frame = CGRect(x: 0, y: 400, width: 230, height: 100)
        guessButton.center.x = view.center.x
        view.addSubview(guessButton)
    }
    
    @objc func actionButtonAction(sender: UIButton) {
        
        let alertForButton = UIAlertController(
            title: "Математика",
            message: "Введите числа для сложение",
            preferredStyle: .alert)
        
        let actionButton = UIAlertAction(title: "Посчитай", style: .default) { _ in
            
            let firstTextField = alertForButton.textFields?.first?.text ?? "nil"
            let secondTextField = alertForButton.textFields?.last?.text ?? "nil"
            
            let firstTextFieldInt = Int(firstTextField) ?? 0
            let secondTextFieldInt = Int(secondTextField) ?? 0
            let sumFirstAndSecondTextField = firstTextFieldInt + secondTextFieldInt
            self.sumLable.text = "Сумма чисел равна: \(sumFirstAndSecondTextField)"
            print(sumFirstAndSecondTextField)
        }
        
        alertForButton.addTextField()
        alertForButton.addTextField()
        
        alertForButton.addAction(actionButton)
        present(alertForButton, animated: true)
    }
    @objc func actionButtonGuess(sender: UIButton) {
        
        let alertForButton = UIAlertController(
            title: "Угадай число",
            message: "Введите число от 1 до 5",
            preferredStyle: .alert)
        
        let actionButton = UIAlertAction(title: "OK", style: .default) { _ in
            let numberRandom = Int.random(in: 1...5)
            let valueOfApp = alertForButton.textFields?.first?.text ?? "0"
            
            if numberRandom == Int(valueOfApp) {
                self.guessLabel.text = "Ты угадал! \(valueOfApp)"
            } else {
                self.guessLabel.text = "Не угадал👻мое число - \(numberRandom)"
            }
        }
        alertForButton.addTextField()
        
        alertForButton.addAction(actionButton)
        present(alertForButton, animated: true)
    }
}
