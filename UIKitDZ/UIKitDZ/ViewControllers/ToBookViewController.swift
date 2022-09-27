//
//  ToBookViewController.swift
//  UIKitDZ
//
//  Created by coder on 26.09.2022.
//
import Foundation
import UIKit
/// ToBookViewController - экран с бронированием компьютеров
class ToBookViewController: UIViewController {
    
    let logoImage: UIImageView = {
        var logo = UIImageView(frame: CGRect(
            x: 0,
            y: 0,
            width: 650,
            height: 900))
        logo.image = UIImage(named: "logovc33")
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    let labelPhone = UILabel()
    let labelName = UILabel()
    let labelDate = UILabel()
    let labelPlace = UILabel()
    
    let textFieldPhone = UITextField()
    let textFieldName = UITextField()
    let textFieldDate = UITextField()
    let textFieldPlace = UITextField()
    
    let datePicker = UIDatePicker()
    let pickerViewPlace = UIPickerView()
    let placeInClub = ["1 - Standart", "2 - Standart",
                       "3 - Standart", "4 - Standart",
                       "5 - Standart", "7 - Standart", "8 - Standart",
                       "9 - Standart", "10 - Standart", "11 - Standart",
                       "13 - VIP", "14 - VIP", "15 - VIP", "16 - VIP", "17 - VIP"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
        settingsLabelsAndTextField()
        buttonCancel()
        buttonEmpty()
        createDatePicker()
        pickerPlace()
    }
    func settingsLabelsAndTextField() {
        labelPhone.text = "Номер телефона"
        labelPhone.textColor = .systemPurple
        labelPhone.font = .boldSystemFont(ofSize: 17)
        labelPhone.frame = CGRect(x: 30, y: 150, width: 150, height: 30)
        view.addSubview(labelPhone)
        
        textFieldPhone.placeholder = "Введите номер телефона"
        textFieldPhone.backgroundColor = .systemGray
        textFieldPhone.frame = CGRect(x: 30, y: 185, width: 350, height: 30)
        textFieldPhone.layer.cornerRadius = 2
        textFieldPhone.clipsToBounds = true
        view.addSubview(textFieldPhone)
        
        labelName.text = "Имя"
        labelName.textColor = .systemPurple
        labelName.font = .boldSystemFont(ofSize: 17)
        labelName.frame = CGRect(x: 30, y: 230, width: 100, height: 30)
        view.addSubview(labelName)
        
        textFieldName.placeholder = "Введите имя"
        textFieldName.backgroundColor = .systemGray
        textFieldName.frame = CGRect(x: 30, y: 265, width: 350, height: 30)
        textFieldName.layer.cornerRadius = 2
        textFieldName.clipsToBounds = true
        view.addSubview(textFieldName)
        
        labelDate.text = "Дата"
        labelDate.textColor = .systemPurple
        labelDate.font = .boldSystemFont(ofSize: 17)
        labelDate.frame = CGRect(x: 30, y: 310, width: 100, height: 30)
        view.addSubview(labelDate)
        
        textFieldDate.placeholder = "Введите дату"
        textFieldDate.backgroundColor = .systemGray
        textFieldDate.frame = CGRect(x: 30, y: 345, width: 350, height: 30)
        textFieldDate.layer.cornerRadius = 2
        textFieldDate.clipsToBounds = true
        view.addSubview(textFieldDate)
        
        labelPlace.text = "Бронируемое место"
        labelPlace.textColor = .systemPurple
        labelPlace.font = .boldSystemFont(ofSize: 17)
        labelPlace.frame = CGRect(x: 30, y: 390, width: 170, height: 30)
        view.addSubview(labelPlace)
        
        textFieldPlace.placeholder = "Выберите место"
        textFieldPlace.backgroundColor = .systemGray
        textFieldPlace.font = .boldSystemFont(ofSize: 17)
        textFieldPlace.frame = CGRect(x: 30, y: 425, width: 350, height: 30)
        textFieldName.layer.cornerRadius = 2
        textFieldPlace.clipsToBounds = true
        view.addSubview(textFieldPlace)
        
    }
    func settingView() {
        logoImage.center.x = view.center.x
        logoImage.center.y = view.center.y
        view.addSubview(logoImage)
    }
    func buttonEmpty() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(saveButton))
        let emptyTabBar = navigationItem.rightBarButtonItem
        emptyTabBar?.tintColor = .systemPurple
    }
    @objc private func saveButton() {
        let alertController = UIAlertController(
            title: .none,
            message: "Забронированно!",
            preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
        
    }
    func buttonCancel() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(backToSecondViewController))
        let tabBar = navigationItem.leftBarButtonItem
        tabBar?.tintColor = .systemPurple
    }
    @objc private func backToSecondViewController() {
        dismiss(animated: true, completion: nil)
    }
    func pickerPlace() {
        pickerViewPlace.dataSource = self
        pickerViewPlace.delegate = self
        // toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        // bar button
        let doneButtonPlace = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: nil,
            action: #selector(donePicker))
        toolBar.setItems([doneButtonPlace], animated: true)
        textFieldPlace.inputAccessoryView = toolBar
        textFieldPlace.inputView = pickerViewPlace
        
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
        textFieldDate.inputAccessoryView = toolBar
        
        /// assign date picker to the text field
        textFieldDate.inputView = datePicker
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        let localeID = Locale.preferredLanguages.first
        datePicker.locale = Locale(identifier: localeID ?? "nil")
    }
    @objc func donePressed() {
        /// formater date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        self.textFieldDate.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}
