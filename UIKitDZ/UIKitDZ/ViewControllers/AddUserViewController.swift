//
//  ThreedViewController.swift
//  UIKitDZ
//
//  Created by coder on 24.09.2022.
//

import Foundation
import UIKit
/// AddUserViewController - Информация о пользователе
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
    let labelChangePhoto = UILabel()
    let labelName = UILabel()
    let labelDate = UILabel()
    let labelAge = UILabel()
    let labelGender = UILabel()
    let labelInstagram = UILabel()
    
    let nameField = UITextField()
    let dateField = UITextField()
    let ageField = UITextField()
    let genderField = UITextField()
    let instagramField = UITextField()
    
    let datePicker = UIDatePicker()
    let pickerViewAge = UIPickerView()
    let pickerGender = UIPickerView()
    let gender = ["Male", "Famale"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        instagramField.addTarget(self,
                                 action: #selector(instagramAction(sender:)),
                                 for: .allEditingEvents)
    }
    @objc private func instagramAction(sender: UITextField) {
        let alertController = UIAlertController(
            title: .none,
            message: "Введите логин instagram",
            preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
            
            let text = alertController.textFields?.first?.text ?? ""
            self.instagramField.text = text
        }
        let alertCancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alertController.addTextField()
        alertController.addAction(alertAction)
        alertController.addAction(alertCancelAction)
        present(alertController, animated: true)
    }
    func settingsPickerAgeAndGender() {
        pickerViewAge.delegate = self
        pickerViewAge.dataSource = self
        
        pickerGender.delegate = self
        pickerGender.dataSource = self
        
        pickerViewAge.tag = 0
        pickerGender.tag = 1
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
        ageField.inputAccessoryView = toolBar
        ageField.inputView = pickerViewAge
        
        let doneButtonGender = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: nil,
            action: #selector(donePicker))
        toolBar.setItems([doneButtonGender], animated: true)
        genderField.inputAccessoryView = toolBar
        genderField.inputView = pickerGender
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
        dateField.inputAccessoryView = toolBar
        
        /// assign date picker to the text field
        dateField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
    }
    @objc func donePressed() {
        /// formater date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.dateField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    func settingsLabels() {
        labelChangePhoto.text = "Изменить фото"
        labelChangePhoto.font = .systemFont(ofSize: 22)
        labelChangePhoto.textColor = .systemBlue
        labelChangePhoto.frame = CGRect(x: 0, y: 290, width: 160, height: 50)
        labelChangePhoto.center.x = view.center.x
        
        labelName.text = "Имя"
        labelName.textColor = .systemBlue
        labelName.font = .systemFont(ofSize: 16)
        labelName.frame = CGRect(x: 20, y: 360, width: 50, height: 30)
        
        labelDate.text = "Дата"
        labelDate.textColor = .systemBlue
        labelDate.font = .systemFont(ofSize: 16)
        labelDate.frame = CGRect(x: 20, y: 440, width: 50, height: 30)
        
        labelAge.text = "Возраст"
        labelAge.textColor = .systemBlue
        labelAge.font = .systemFont(ofSize: 16)
        labelAge.frame = CGRect(x: 20, y: 520, width: 70, height: 30)
    
        labelGender.text = "Пол"
        labelGender.textColor = .systemBlue
        labelGender.font = .systemFont(ofSize: 16)
        labelGender.frame = CGRect(x: 20, y: 600, width: 70, height: 30)
        
        labelInstagram.text = "Instagram"
        labelInstagram.textColor = .systemBlue
        labelInstagram.font = .systemFont(ofSize: 16)
        labelInstagram.frame = CGRect(x: 20, y: 680, width: 90, height: 30)
        
        view.addSubview(labelChangePhoto)
        view.addSubview(labelName)
        view.addSubview(labelDate)
        view.addSubview(labelAge)
        view.addSubview(labelGender)
        view.addSubview(labelInstagram)
    }
    func settingsTextField() {
        nameField.frame = CGRect(x: 20, y: 390, width: 330, height: 30)
        nameField.placeholder = "Введите имя"
        nameField.borderStyle = .roundedRect
        
        dateField.frame = CGRect(x: 20, y: 470, width: 330, height: 30)
        dateField.placeholder = "Введите дату"
        dateField.borderStyle = .roundedRect
        
        ageField.frame = CGRect(x: 20, y: 550, width: 330, height: 30)
        ageField.placeholder = "Добавить"
        ageField.borderStyle = .roundedRect
        
        genderField.frame = CGRect(x: 20, y: 630, width: 330, height: 30)
        genderField.placeholder = "Добавить"
        genderField.borderStyle = .roundedRect
        
        instagramField.frame = CGRect(x: 20, y: 710, width: 330, height: 30)
        instagramField.placeholder = "Добавить"
        instagramField.borderStyle = .roundedRect
        
        view.addSubview(nameField)
        view.addSubview(dateField)
        view.addSubview(ageField)
        view.addSubview(genderField)
        view.addSubview(instagramField)
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
