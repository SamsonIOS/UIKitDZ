//
//  ThreedViewController.swift
//  UIKitDZ
//
//  Created by coder on 24.09.2022.
//

import Foundation
import UIKit
/// AddUserViewController - Третий экран с добавлением нового человека
class AddUserViewController: UIViewController {
   
    let imageUser: UIImageView = {
        let imageUser = UIImageView(frame: CGRect(
            x: 0,
            y: 110,
            width: 170,
            height: 170))
        imageUser.image = UIImage(named: "default")
        imageUser.layer.cornerRadius = 80
        imageUser.clipsToBounds = true
        return imageUser
    }()
    let changePhotoLabel = UILabel()
    let nameLabel = UILabel()
    let dateLabel = UILabel()
    let ageLabel = UILabel()
    let genderLabel = UILabel()
    let instagramLabel = UILabel()
    
    let nameTextField = UITextField()
    let dateTextField = UITextField()
    let ageTextField = UITextField()
    let genderTextField = UITextField()
    let instagramTextField = UITextField()
    
    let datePicker = UIDatePicker()
    let viewAgePicker = UIPickerView()
    let genderViewPicker = UIPickerView()
    let gender = ["Male", "Famale"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    func configureView() {
        buttonCancel()
        settingsThreedVc()
        buttonEmpty()
        settingsLabels()
        settingsTextField()
        createDatePicker()
        pickerAgeAndGender()
        instagramAlert()
        settingsPickerAgeAndGender()
    }
    func instagramAlert() {
        instagramTextField.addTarget(self,
                                 action: #selector(instagramAlertAction(sender:)),
                                 for: .allEditingEvents)
    }
    @objc private func instagramAlertAction(sender: UITextField) {
        let alertController = UIAlertController(
            title: .none,
            message: "Введите логин instagram",
            preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
            
            let text = alertController.textFields?.first?.text ?? ""
            self.instagramTextField.text = text
        }
        let alertCancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alertController.addTextField()
        alertController.addAction(alertAction)
        alertController.addAction(alertCancelAction)
        present(alertController, animated: true)
    }
    func settingsPickerAgeAndGender() {
        viewAgePicker.delegate = self
        viewAgePicker.dataSource = self
        
        genderViewPicker.delegate = self
        genderViewPicker.dataSource = self
        
        viewAgePicker.tag = 0
        genderViewPicker.tag = 1
    }
    func pickerAgeAndGender() {
        // toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        // bar button
        let doneButtonAge = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: nil,
            action: #selector(donePicker))
        toolBar.setItems([doneButtonAge], animated: true)
        ageTextField.inputAccessoryView = toolBar
        ageTextField.inputView = viewAgePicker
        
        let doneButtonGender = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: nil,
            action: #selector(donePicker))
        toolBar.setItems([doneButtonGender], animated: true)
        genderTextField.inputAccessoryView = toolBar
        genderTextField.inputView = genderViewPicker
    }
    @objc func donePicker() {
        self.view.endEditing(true)
    }
    func createDatePicker () {
        /// toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        /// bar button
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: nil,
            action: #selector(donePressed))
        toolBar.setItems([doneButton], animated: true)
        /// assign toolbar
        dateTextField.inputAccessoryView = toolBar
        
        /// assign date picker to the text field
        dateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
    }
    @objc func donePressed() {
        /// formater date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.dateTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    func settingsLabels() {
        changePhotoLabel.text = "Изменить фото"
        changePhotoLabel.font = .systemFont(ofSize: 22)
        changePhotoLabel.textColor = .systemBlue
        changePhotoLabel.frame = CGRect(x: 0, y: 290, width: 160, height: 50)
        changePhotoLabel.center.x = view.center.x
        
        nameLabel.text = "Имя"
        nameLabel.textColor = .systemBlue
        nameLabel.font = .systemFont(ofSize: 16)
        nameLabel.frame = CGRect(x: 20, y: 360, width: 50, height: 30)
        
        dateLabel.text = "Дата"
        dateLabel.textColor = .systemBlue
        dateLabel.font = .systemFont(ofSize: 16)
        dateLabel.frame = CGRect(x: 20, y: 440, width: 50, height: 30)
        
        ageLabel.text = "Возраст"
        ageLabel.textColor = .systemBlue
        ageLabel.font = .systemFont(ofSize: 16)
        ageLabel.frame = CGRect(x: 20, y: 520, width: 70, height: 30)
    
        genderLabel.text = "Пол"
        genderLabel.textColor = .systemBlue
        genderLabel.font = .systemFont(ofSize: 16)
        genderLabel.frame = CGRect(x: 20, y: 600, width: 70, height: 30)
        
        instagramLabel.text = "Instagram"
        instagramLabel.textColor = .systemBlue
        instagramLabel.font = .systemFont(ofSize: 16)
        instagramLabel.frame = CGRect(x: 20, y: 680, width: 90, height: 30)
        
        view.addSubview(changePhotoLabel)
        view.addSubview(nameLabel)
        view.addSubview(dateLabel)
        view.addSubview(ageLabel)
        view.addSubview(genderLabel)
        view.addSubview(instagramLabel)
    }
    func settingsTextField() {
        nameTextField.frame = CGRect(x: 20, y: 390, width: 330, height: 30)
        nameTextField.placeholder = "Введите имя"
        nameTextField.borderStyle = .roundedRect
        
        dateTextField.frame = CGRect(x: 20, y: 470, width: 330, height: 30)
        dateTextField.placeholder = "Введите дату"
        dateTextField.borderStyle = .roundedRect
        
        ageTextField.frame = CGRect(x: 20, y: 550, width: 330, height: 30)
        ageTextField.placeholder = "Добавить"
        ageTextField.borderStyle = .roundedRect
        
        genderTextField.frame = CGRect(x: 20, y: 630, width: 330, height: 30)
        genderTextField.placeholder = "Добавить"
        genderTextField.borderStyle = .roundedRect
        
        instagramTextField.frame = CGRect(x: 20, y: 710, width: 330, height: 30)
        instagramTextField.placeholder = "Добавить"
        instagramTextField.borderStyle = .roundedRect
        
        view.addSubview(nameTextField)
        view.addSubview(dateTextField)
        view.addSubview(ageTextField)
        view.addSubview(genderTextField)
        view.addSubview(instagramTextField)
    }
    func settingsThreedVc() {
        view.backgroundColor = .white
        imageUser.center.x = view.center.x
        view.addSubview(imageUser)
    }
    func buttonCancel() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(backToSecondViewController))
        let tabBar = navigationItem.leftBarButtonItem
        tabBar?.tintColor = .systemBlue
    }
    @objc private func backToSecondViewController() {
        dismiss(animated: true, completion: nil)
    }
    func buttonEmpty() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(saveButtonAction))
        let emptyTabBar = navigationItem.rightBarButtonItem
        emptyTabBar?.tintColor = .systemBlue
    }
    @objc private func saveButtonAction() {
        dismiss(animated: true)
    }
}
