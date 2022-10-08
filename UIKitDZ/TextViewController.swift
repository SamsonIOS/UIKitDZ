//
//  FoodViewController.swift
//  UIKitDZ
//
//  Created by coder on 04.10.2022.
//

import UIKit

/// Экран с настройками текста
final class TextViewController: UIViewController {
    
    // MARK: Private Properties
    private lazy var colorSwitch: UISwitch = {
        let colorSwitch = UISwitch(frame: CGRect(
            x: 0, y: 750, width: 50, height: 50))
        colorSwitch.isOn = false
        colorSwitch.center.x = self.view.center.x
        colorSwitch.addTarget(self, action: #selector(colorSwitchAction(sender:)), for: .valueChanged)
        return colorSwitch
    }()
    
    private lazy var statusLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 0, y: 300, width: 150, height: 200))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.center.x = self.view.center.x
        label.text = ""
        return label
    }()
    
    private lazy var fontSlider: UISlider = {
        var slider = UISlider(frame: CGRect(
            x: 0, y: 700, width: 230, height: 50))
        slider.center.x = self.view.center.x
        slider.minimumValue = 10
        slider.maximumValue = 50
        slider.value = 10
        slider.addTarget(self, action: #selector(fontSliderAction(sender:)), for: .valueChanged)
        return slider
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        addElementsOnView()
    }
    
    // MARK: Private Methods
    private func addElementsOnView() {
        view.addSubview(colorSwitch)
        view.addSubview(statusLabel)
        view.addSubview(fontSlider)
        addButton()
    }
    
    private func addButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
                    barButtonSystemItem:
                    .add,
                    target: self,
                    action: #selector(addTitleInLabelAction))
    }
    
    // MARK: @Objc private action
    @objc private func addTitleInLabelAction() {
        let alertController = UIAlertController(
                   title: .none,
                   message: "Введите ваше слово",
                   preferredStyle: .alert)
               let alertControllerAction = UIAlertAction(
                   title: "OK",
                   style: .default) { _ in
                       let text = alertController.textFields?.first?.text ?? "nil"
                       self.statusLabel.text = text
                       
                   }
               alertController.addTextField()
               alertController.addAction(alertControllerAction)
               present(alertController, animated: true)
    }
    
    @objc private func colorSwitchAction(sender: UISwitch) {
        if sender.isOn {
            statusLabel.text = "Наташа Бомба"
            statusLabel.lineBreakMode = .byWordWrapping
            view.backgroundColor = .purple
        } else {
            statusLabel.text = ""
            view.backgroundColor = .yellow
        }
    }
    
    @objc private func fontSliderAction(sender: UISlider) {
        statusLabel.font = .systemFont(ofSize: CGFloat(sender.value))
    }
}
