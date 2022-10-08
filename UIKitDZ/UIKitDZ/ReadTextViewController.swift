//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit

/// Экран с текстом и настройками текста
final class ReadTextViewController: UIViewController {
    
    // MARK: Private Methods
    private enum Constants {
        static let styles = [ "Arial", "Georgia", "Verdana", "Impact", "Avenir-Light"]
    }
    
    private lazy var bookTextView: UITextView = {
        var textView = UITextView(frame: CGRect(
            x: 0,
            y: 50,
            width: self.view.bounds.width,
            height: 700))
        textView.text = book.text
        textView.contentInset = UIEdgeInsets(top: 50, left: 10, bottom: 50, right: 10)
        textView.isEditable = false
        textView.textAlignment = .justified
        return textView
    }()
    
    private lazy var textSlider: UISlider = {
        var slider = UISlider(frame: CGRect(
            x: 110,
            y: 750,
            width: 250,
            height: 50))
        slider.minimumValue = 5
        slider.maximumValue = 40
        slider.value = 10
        slider.addTarget(self, action: #selector(textSliderAction), for: .valueChanged)
        return slider
    }()
    
    private lazy var colorBackgroundSwitch: UISwitch = {
        var colorSwitch = UISwitch(frame: CGRect(
            x: 20,
            y: 770,
            width: 50,
            height: 50))
        colorSwitch.isOn = false
        colorSwitch.addTarget(self, action: #selector(colorSwitchAction(sender:)), for: .touchUpInside)
        return colorSwitch
    }()
    
    private lazy var fontSegmentControl: UISegmentedControl = {
        let items = ["a", "A"]
        var segment = UISegmentedControl(items: items)
        segment.frame = CGRect(
            x: 20,
            y: 820,
            width: 70,
            height: 30)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(changeFontAction), for: .valueChanged)
        return segment
    }()
    
    private lazy var mintButton: UIButton = {
        var button = UIButton(frame: CGRect(
            x: 100, y: 800, width: 40, height: 40))
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.tag = 0
        button.addTarget(self, action: #selector(changeColorAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var purpleButton: UIButton = {
        var button = UIButton(frame: CGRect(
            x: 150, y: 800, width: 40, height: 40))
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.tag = 1
        button.addTarget(self, action: #selector(changeColorAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var blueButton: UIButton = {
        var button = UIButton(frame: CGRect(
            x: 200, y: 800, width: 40, height: 40))
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.tag = 2
        button.addTarget(self, action: #selector(changeColorAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var greenButton: UIButton = {
        var button = UIButton(frame: CGRect(
            x: 250, y: 800, width: 40, height: 40))
        button.backgroundColor = .green
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.tag = 3
        button.addTarget(self, action: #selector(changeColorAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var styleButton: UIButton = {
        var button = UIButton(frame: CGRect(
            x: 300, y: 800, width: 60, height: 40))
        button.backgroundColor = .yellow
        button.setTitle("Style", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(changeStyleButtonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private let styleTextField: UITextField = {
        let text = UITextField()
        return text
    }()
    
    private let stylePickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewController()
    }
    
    // MARK: Public Methods
    func setViewController() {
        stylePickerView.delegate = self
        stylePickerView.dataSource = self
        
        styleTextField.inputView = stylePickerView
        styleTextField.isHidden = true
        
        view.addSubview(bookTextView)
        view.addSubview(textSlider)
        view.addSubview(fontSegmentControl)
        view.addSubview(mintButton)
        view.addSubview(purpleButton)
        view.addSubview(blueButton)
        view.addSubview(greenButton)
        view.addSubview(styleButton)
        view.addSubview(styleTextField)
        view.addSubview(colorBackgroundSwitch)
    }
    
    // MARK: @Objc private Action
    @objc private func textSliderAction() {
        bookTextView.font = bookTextView.font?.withSize(CGFloat(textSlider.value))
    }
    
    @objc private func changeFontAction() {
        let size = bookTextView.font?.pointSize ?? 10
        if fontSegmentControl.selectedSegmentIndex == 1 {
            bookTextView.font = UIFont.systemFont(ofSize: size, weight: UIFont.Weight(rawValue: 0.8))
        } else {
            bookTextView.font = UIFont.systemFont(ofSize: size, weight: UIFont.Weight(rawValue: 0.2))
        }
    }
    
    @objc private func changeColorAction(sender: UIButton) {
        switch sender.tag {
        case 0:
            bookTextView.textColor = .systemMint
        case 1:
            bookTextView.textColor = .purple
        case 2:
            bookTextView.textColor = .blue
        case 3:
            bookTextView.textColor = .green
        default:
            break
        }
    }
    
    @objc private func changeStyleButtonAction(sender: UIButton) {
        styleTextField.becomeFirstResponder()
    }
    
    @objc private func colorSwitchAction(sender: UISwitch) {
        if sender.isOn {
            view.backgroundColor = .black
            bookTextView.textColor = .white
            bookTextView.backgroundColor = .black
            fontSegmentControl.backgroundColor = .systemGray
        } else {
            view.backgroundColor = .white
            bookTextView.textColor = .black
            bookTextView.backgroundColor = .white
            fontSegmentControl.backgroundColor = .white
        }
    }
}

// MARK: ReadTextViewController + UIPickerViewDelegate, UIPickerViewDataSource
extension ReadTextViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Constants.styles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        Constants.styles[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let size = bookTextView.font?.pointSize ?? 20
        
        bookTextView.font = UIFont(name: Constants.styles[row], size: size)
    }
}
