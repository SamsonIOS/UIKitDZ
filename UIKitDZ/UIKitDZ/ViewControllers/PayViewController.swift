//
//  PayViewController.swift
//  UIKitDZ
//
//  Created by coder on 29.09.2022.
//

import UIKit
/// Экран с оплатой
final class PayViewController: UIViewController {
    
    // MARK: Properties
     weak var delegate: PopToRootDelegate?
    
     let pizzaNameLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 20, y: 180, width: 250, height: 50))
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .systemOrange
        return label
    }()
    
    let chesseIngridientLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 20, y: 210, width: 350, height: 50))
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .systemGray
        label.text = ": "
        return label
    }()
    
    let pizzaSelectedImage: UIImageView = {
        var imageView = UIImageView(frame: CGRect(
            x: 0, y: 270, width: 300, height: 300))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: Private Properties
    private let yourOrderLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 20, y: 100, width: 200, height: 70))
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .systemOrange
        label.text = "Ваш заказ:"
        return label
    }()
    
    private let cardPayLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 30, y: 650, width: 250, height: 50))
        label.text = "Оплата картой"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    private let cashPayLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 30, y: 720, width: 250, height: 50))
        label.text = "Оплата наличкой"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    private let payImage: UIImageView = {
        var imageView = UIImageView(frame: CGRect(
            x: 0, y: 10, width: 70, height: 70))
        imageView.image = UIImage(named: "payImage")
        return imageView
    }()
    
    private lazy var cardSwitch: UISwitch = {
        let cardSwitch = UISwitch(frame: CGRect(
            x: 340, y: 660, width: 50, height: 50))
        cardSwitch.tag = 0
        cardSwitch.addTarget(self, action: #selector(paySwitchAction(sender:)), for: .touchUpInside)
        return cardSwitch
    }()
    
    private lazy var cashSwitch: UISwitch = {
        let cashSwitch = UISwitch(frame: CGRect(
            x: 340, y: 730, width: 50, height: 50))
        cashSwitch.tag = 1
        cashSwitch.addTarget(self, action: #selector(paySwitchAction(sender:)), for: .touchUpInside)
        return cashSwitch
    }()
    
    private lazy var payButton: UIButton = {
        var button = UIButton(frame: CGRect(
            x: 0, y: 800, width: 280, height: 60))
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setImage(UIImage(named: "payImage"), for: .normal)
        button.addTarget(self, action: #selector(payButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviewElements()
    }
    // MARK: Public Methods
    func addSubviewElements() {
        title = "PAY"
        pizzaSelectedImage.center.x = view.center.x
        payButton.center.x = view.center.x
        payImage.center.x = view.center.x
        
        view.backgroundColor = .white
        view.addSubview(pizzaNameLabel)
        view.addSubview(chesseIngridientLabel)
        view.addSubview(pizzaSelectedImage)
        view.addSubview(yourOrderLabel)
        view.addSubview(cardPayLabel)
        view.addSubview(cashPayLabel)
        view.addSubview(cardSwitch)
        view.addSubview(cashSwitch)
        view.addSubview(payButton)
    }
    
    // MARK: @Objc private Action
    @objc private func payButtonAction() {
        if cardSwitch.isOn || cashSwitch.isOn {
            let alertController = UIAlertController(
                title: "Заказ оплачен!",
                message: "Ваш заказ доставят в течении 15 минут! Приятного аппетита",
                preferredStyle: .alert)
            let alertControllerAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.dismiss(animated: false)
                self.delegate?.goToBack()
            }
            alertController.addAction(alertControllerAction)
            present(alertController, animated: false)
        } else {
            let alertController2 = UIAlertController(
                title: "Ошибка",
                message: "Выберите способ оплаты",
                preferredStyle: .alert)
            let alertControllerAction2 = UIAlertAction(title: "OK", style: .cancel)
            alertController2.addAction(alertControllerAction2)
            present(alertController2, animated: true)
        }
    }
    
    @objc private func paySwitchAction(sender: UISwitch) {
        switch sender.tag {
        case 0:
            cardSwitch.setOn(true, animated: true)
            cashSwitch.setOn(false, animated: true)
        case 1:
            cardSwitch.setOn(false, animated: true)
            cashSwitch.setOn(true, animated: true)
        default:
            break
        }
    }
}
