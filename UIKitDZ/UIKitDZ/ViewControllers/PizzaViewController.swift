//
//  PizzaViewController.swift
//  UIKitDZ
//
//  Created by coder on 29.09.2022.
//

import UIKit
/// Экран со списком пицц
final class PizzaViewController: UIViewController {
    
    // MARK: Private Properties
    private let pizzaChickenImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chicken")
        imageView.frame = CGRect(x: 25, y: 150, width: 140, height: 140)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let pizzaPeperoniImage: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "peperoni")
        imageView.frame = CGRect(x: 25, y: 350, width: 140, height: 140)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let pizzaChickenLabel: UILabel = {
        var label = UILabel()
        label.text = "Chicken BBQ"
        label.textColor = .systemOrange
        label.font = .boldSystemFont(ofSize: 22)
        label.frame = CGRect(x: 170, y: 180, width: 150, height: 50)
        return label
    }()
    
    private let pizzaPeperoniLabel: UILabel = {
        var label = UILabel()
        label.text = "Pepperoni 🌶"
        label.textColor = .systemOrange
        label.font = .boldSystemFont(ofSize: 22)
        label.frame = CGRect(x: 170, y: 390, width: 180, height: 50)
        return label
    }()
    
    private lazy var addChickenIngridientsButton: UIButton = {
        var button = UIButton()
        button.tag = 0
        button.setTitle("+ добавки", for: .normal)
        button.backgroundColor = .systemOrange
        button.frame = CGRect(x: 310, y: 185, width: 90, height: 40)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(addIngridientsButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var addPeperoniIngridientsButton: UIButton = {
        var button = UIButton()
        button.tag = 1
        button.setTitle("+ добавки", for: .normal)
        button.backgroundColor = .systemOrange
        button.frame = CGRect(x: 310, y: 395, width: 90, height: 40)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(addIngridientsButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviewElements()
    }
    
    // MARK: Public Methods
    func addSubviewElements() {
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.topItem?.title = ""
        title = "Pizza"
        view.addSubview(pizzaChickenImage)
        view.addSubview(pizzaPeperoniImage)
        view.addSubview(pizzaChickenLabel)
        view.addSubview(pizzaPeperoniLabel)
        view.addSubview(addChickenIngridientsButton)
        view.addSubview(addPeperoniIngridientsButton)
    }
    
    // MARK: @Objc Action
    @objc private func addIngridientsButtonAction(_ sender: UIButton) {
        let ingridientsVC = IngridientsViewController()
        navigationController?.modalPresentationStyle = .fullScreen
        switch sender.tag {
        case 0:
            ingridientsVC.pizzaNamaLabel.text = pizzaChickenLabel.text
            ingridientsVC.pizzaImage.image = UIImage(named: "chicken")
        case 1:
            ingridientsVC.pizzaNamaLabel.text = pizzaPeperoniLabel.text
            ingridientsVC.pizzaImage.image = UIImage(named: "peperoni")
        default:
            break
        }
        present(ingridientsVC, animated: true)
    }
}
