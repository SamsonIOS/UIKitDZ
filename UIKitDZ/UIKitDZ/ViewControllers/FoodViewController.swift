//
//  FoodViewController.swift
//  UIKitDZ
//
//  Created by coder on 28.09.2022.
//

import UIKit
/// Экран с выбором еды
final class FoodViewController: UIViewController {
    
    // MARK: Private Properties
    private lazy var pizzaButton: UIButton = {
        var button = UIButton()
        button.setTitle("Пицца", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.frame = CGRect(x: 20, y: 150, width: 350, height: 100)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(pizzaButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var sushiButton: UIButton = {
        var sushiButton = UIButton()
        sushiButton.setTitle("Суши", for: .normal)
        sushiButton.setTitleColor(.black, for: .normal)
        sushiButton.layer.borderWidth = 1
        sushiButton.layer.borderColor = UIColor.black.cgColor
        sushiButton.frame = CGRect(x: 20, y: 300, width: 350, height: 100)
        sushiButton.layer.cornerRadius = 5
        sushiButton.clipsToBounds = true
        sushiButton.backgroundColor = .systemOrange
        return sushiButton
    }()
    
    private lazy var contactButton: UIButton = {
        var button = UIButton(frame: CGRect(
            x: 0,
            y: 500,
            width: 150,
            height: 70))
        button.backgroundColor = .systemBlue
        button.setTitle("Позвонить нам", for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(contactButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: Public Properties
    let pizzaPhoto: UIImageView = {
        var pizzaLogo = UIImageView(frame: CGRect(
            x: 10,
            y: 0,
            width: 120,
            height: 113))
        pizzaLogo.image = UIImage(named: "pizza")
        return pizzaLogo
    }()
    
    let sushiPhoto: UIImageView = {
        var sushiLogo = UIImageView(frame: CGRect(
            x: 10,
            y: 5,
            width: 105,
            height: 90))
        sushiLogo.image = UIImage(named: "sushi")
        return sushiLogo
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviewElements()
    }
    
    // MARK: Public Methods
    func addSubviewElements() {
        title = "Food"
        view.addSubview(pizzaButton)
        pizzaButton.addSubview(pizzaPhoto)
        view.addSubview(sushiButton)
        sushiButton.addSubview(sushiPhoto)
        contactButton.center.x = view.center.x
        view.addSubview(contactButton)
    }
    
    // MARK: @Objc private Action
    @objc private func pizzaButtonAction() {
        let pizzaVC = PizzaViewController()
        navigationController?.pushViewController(pizzaVC, animated: true)
    }
    
    @objc private func contactButtonAction() {
        let alertController = UIAlertController(title: "Позвонить нам", message: "+79992341362", preferredStyle: .alert)
        let alerControllerAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(alerControllerAction)
        present(alertController, animated: true)
    }
}
