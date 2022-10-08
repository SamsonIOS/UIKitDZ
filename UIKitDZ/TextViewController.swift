//
//  FoodViewController.swift
//  UIKitDZ
//
//  Created by coder on 04.10.2022.
//

import UIKit

/// Экран с выбором еды
final class TextViewController: UIViewController {

    private lazy var colorSwitch: UISwitch = {
        let colorSwitch = UISwitch(frame: CGRect(
            x: 20, y: 200, width: 50, height: 50))
        colorSwitch.isOn = false
        colorSwitch.addTarget(self, action: #selector(colorSwitchAction(sender:)), for: .valueChanged)
        return colorSwitch
    }()
    
    private lazy var statusLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 0, y: 300, width: 150, height: 100))
        label.numberOfLines = 0
        label.center.x = self.view.center.x
        label.text = ""
        return label
    }()
    
    private lazy var fontSlider: UISlider = {
        var slider = UISlider(frame: CGRect(
            x: 0, y: 500, width: 150, height: 50))
        slider.center.x = self.view.center.x
        slider.minimumValue = 10
        slider.maximumValue = 50
        slider.value = 10
        slider.addTarget(self, action: #selector(fontSliderAction(sender:)), for: .valueChanged)
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        addElementsOnView()
    }
    
    private func addElementsOnView() {
        view.addSubview(colorSwitch)
        view.addSubview(statusLabel)
        view.addSubview(fontSlider)
    }
    
    @objc private func colorSwitchAction(sender: UISwitch) {
        if sender.isOn {
            statusLabel.text = "Наташа Бомба"
            view.backgroundColor = .purple
        } else {
            statusLabel.text = "Наташа супер"
            view.backgroundColor = .yellow
        }
    }
    
    @objc private func fontSliderAction(sender: UISlider) {
        statusLabel.font = .systemFont(ofSize: CGFloat(sender.value))
    }
}
