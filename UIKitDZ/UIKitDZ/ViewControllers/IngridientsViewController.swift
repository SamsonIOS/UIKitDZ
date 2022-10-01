//
//  IngridientsViewController.swift
//  UIKitDZ
//
//  Created by coder on 29.09.2022.
//

import UIKit
/// Протокол  для расширения
protocol PopToRootVC: AnyObject {
    func goToBack()
}
/// Экран с ингредиентами
final class IngridientsViewController: UIViewController {
    
    // MARK: Public properties
     let pizzaImage: UIImageView = {
        var image = UIImageView(frame: CGRect(
            x: 0, y: 120, width: 300, height: 300))
        return image
    }()
    
     let pizzaNamaLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 0, y: 40, width: 200, height: 50))
         label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    let chesseLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 40, y: 470, width: 250, height: 30))
        label.font = .boldSystemFont(ofSize: 19)
        label.text = "Сыр моцарела"
        label.textColor = .black
        return label
    }()
    
    let chesseSwitch: UISwitch = {
        var setSwitch = UISwitch(frame: CGRect(
            x: 350, y: 470, width: 50, height: 40))
        setSwitch.isOn = false
        return setSwitch
    }()
    
    let hamLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 40, y: 530, width: 250, height: 30))
        label.font = .boldSystemFont(ofSize: 19)
        label.text = "Ветчина"
        label.textColor = .black
        return label
    }()
    
    let humSwitch: UISwitch = {
        var setSwitch = UISwitch(frame: CGRect(
            x: 350, y: 530, width: 50, height: 40))
        setSwitch.isOn = true
        return setSwitch
    }()
    
    let mushroomsLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 40, y: 590, width: 250, height: 30))
        label.font = .boldSystemFont(ofSize: 19)
        label.text = "Грибы"
        label.textColor = .black
        return label
    }()
    
    let mushroomsSwitch: UISwitch = {
        var setSwitch = UISwitch(frame: CGRect(
            x: 350, y: 590, width: 50, height: 40))
        setSwitch.isOn = false
        return setSwitch
    }()
    
    let maslinsLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 40, y: 650, width: 250, height: 30))
        label.font = .boldSystemFont(ofSize: 19)
        label.text = "Маслины"
        label.textColor = .black
        return label
    }()
    
    let maslinsSwitch: UISwitch = {
        var setSwitch = UISwitch(frame: CGRect(
            x: 350, y: 650, width: 50, height: 40))
        return setSwitch
    }()
    
    // MARK: Private Properties
    private lazy var orderButton: UIButton = {
        var button = UIButton(frame: CGRect(
            x: 0, y: 700, width: 270, height: 50))
        button.setTitle("Заказать", for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(orderButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviewElements()
    }
    
    // MARK: Public Methods
    func addSubviewElements() {
        view.backgroundColor = .white
        pizzaImage.center.x = view.center.x
        pizzaNamaLabel.center.x = view.center.x
        orderButton.center.x = view.center.x
        view.addSubview(pizzaImage)
        view.addSubview(pizzaNamaLabel)
        view.addSubview(chesseLabel)
        view.addSubview(hamLabel)
        view.addSubview(mushroomsLabel)
        view.addSubview(maslinsLabel)
        view.addSubview(orderButton)
        view.addSubview(chesseSwitch)
        view.addSubview(humSwitch)
        view.addSubview(mushroomsSwitch)
        view.addSubview(maslinsSwitch)
    }
    
    // MARK: @Objc action
    @objc private func orderButtonAction() {
        let payViewController = PayViewController()
        payViewController.delegate = self
        let navigationVC = UINavigationController(rootViewController: payViewController)
        payViewController.pizzaNameLabel.text = pizzaNamaLabel.text
        
        if chesseSwitch.isOn {
            payViewController.chesseIngridientLabel.text? += "+\(chesseLabel.text ?? "Сыр Моцарела") "
        }
        
        if humSwitch.isOn {
            payViewController.chesseIngridientLabel.text? += "+\(hamLabel.text ?? "Ветчина") "
        }
        
        if mushroomsSwitch.isOn {
            payViewController.chesseIngridientLabel.text? += "+\(mushroomsLabel.text ?? "Грибы") "
        }

        if maslinsSwitch.isOn {
            payViewController.chesseIngridientLabel.text? += "+\(maslinsLabel.text ?? "Маслины") "
        }
        
        payViewController.pizzaSelectedImage.image = pizzaImage.image
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC, animated: true)
    }
}

/// Расширяем наш контролер с ингредиентами
extension  IngridientsViewController: PopToRootVC {
    func goToBack() {
        if let viewController = self.presentingViewController as? UINavigationController {
            view.isHidden = true
            dismiss(animated: false)
            viewController.popToRootViewController(animated: false)
        }
    }
}
