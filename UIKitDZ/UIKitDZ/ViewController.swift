//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// Первый экран с пикерами, слайдером и лэйблом
class ViewController: UIViewController {

    // MARK: Private proreties
    private lazy var fontSlider: UISlider = {
        var slider = UISlider(frame: CGRect(
            x: 0,
            y: 550,
            width: 250,
            height: 30))
        slider.tintColor = .green
        slider.minimumValue = 8
        slider.maximumValue = 54
        slider.value = 10
        slider.center.x = view.center.x
        
        slider.addTarget(self, action: #selector(changeFontLabelAction), for: .valueChanged)
        return slider
    }()
    
    private lazy var changeColorPicker: UIPickerView = {
        var picker = UIPickerView(frame: CGRect(
            x: 30,
            y: 600,
            width: 150,
            height: 150))
        picker.dataSource = self
        picker.delegate = self
        picker.layer.borderWidth = 1
        picker.layer.borderColor = UIColor.green.cgColor
        picker.tag = 0
        return picker
    }()
    
    private lazy var numberOfLinesPicker: UIPickerView = {
        var picker = UIPickerView(frame: CGRect(
            x: 230,
            y: 600,
            width: 150,
            height: 150))
        picker.dataSource = self
        picker.delegate = self
        picker.layer.borderWidth = 1
        picker.layer.borderColor = UIColor.green.cgColor
        picker.tag = 1
        return picker
    }()
    
    // MARK: Public Properties
    lazy var someTextInLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 50,
            y: 150,
            width: 350,
            height: 200))
        label.font = label.font.withSize(CGFloat(fontSlider.value))
        label.center.x = view.center.x
        label.textAlignment = .center
        label.text = "Введите текст"
        label.numberOfLines = 0
        label.shadowColor = .black
        label.lineBreakMode = .byClipping
        label.shadowOffset = CGSize(width: 1, height: 1)
        return label
    }()
    
    let valuesNumberLinePicker = [0, 1, 2, 3, 5, 9]
    
    let valuesColorPicker = [
        ("gray", UIColor.gray),
        ("green", UIColor.green),
        ("red", UIColor.red),
        ("blue", UIColor.blue),
        ("black", UIColor.black)]
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControler()
        createAddButton()
    }
    
    // MARK: Public Methods
    func setViewControler() {
        title = "Первый экран"
        view.backgroundColor = .white
        view.addSubview(someTextInLabel)
        view.addSubview(fontSlider)
        view.addSubview(changeColorPicker)
        view.addSubview(numberOfLinesPicker)
    }
    
    func createAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:
            .add,
            target: self,
            action: #selector(addTitleInLabel))
    }
    
    // MARK: @Objc private func
    @objc private func addTitleInLabel() {
        let alertController = UIAlertController(
            title: .none,
            message: "Введите ваше слово",
            preferredStyle: .alert)
        let alertControllerAction = UIAlertAction(
            title: "OK",
            style: .default) { _ in
                let text = alertController.textFields?.first?.text ?? "nil"
                self.someTextInLabel.text = text
                
            }
        alertController.addTextField()
        alertController.addAction(alertControllerAction)
        present(alertController, animated: true)
    }
    
    @objc private func changeFontLabelAction(sender: UISlider) {
        someTextInLabel.font = someTextInLabel.font.withSize(CGFloat(fontSlider.value))
    }
}
