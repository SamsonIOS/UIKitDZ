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
    // MARK: Constants
    let logoImage: UIImageView = {
        var logo = UIImageView(frame: CGRect(
            x: 0,
            y: 0,
            width: 650,
            height: 900))
        logo.image = UIImage(named: "logovc3")
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    
    let phoneLabel = UILabel()
    let nameLabel = UILabel()
    let dateLabel = UILabel()
    let placeLabel = UILabel()
    
    let phoneTextField = UITextField()
    let nameTextField = UITextField()
    let dateTextField = UITextField()
    let placeTextField = UITextField()

    let datePicker = UIDatePicker()
    let pickerViewPlace = UIPickerView()
    let placeInClub = ["1 - Standart", "2 - Standart",
                       "3 - Standart", "4 - Standart",
                       "5 - Standart", "7 - Standart", "8 - Standart",
                       "9 - Standart", "10 - Standart", "11 - Standart",
                       "13 - VIP", "14 - VIP", "15 - VIP", "16 - VIP", "17 - VIP"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSettings()
    }
    // MARK: Function Settings
    func configureSettings() {
        settingView()
        settingsLabelsAndTextField()
        buttonCancel()
        buttonEmpty()
        createDatePicker()
        pickerPlace()
    }
    
    func settingsLabelsAndTextField() {
        phoneLabel.text = "Номер телефона"
        phoneLabel.textColor = .systemPurple
        phoneLabel.font = .boldSystemFont(ofSize: 17)
        phoneLabel.frame = CGRect(x: 30, y: 150, width: 150, height: 30)
        view.addSubview(phoneLabel)
        
        phoneTextField.placeholder = "Введите номер телефона"
        phoneTextField.backgroundColor = .systemGray
        phoneTextField.frame = CGRect(x: 30, y: 185, width: 350, height: 30)
        phoneTextField.layer.cornerRadius = 2
        phoneTextField.clipsToBounds = true
        view.addSubview(phoneTextField)
        
        nameLabel.text = "Имя"
        nameLabel.textColor = .systemPurple
        nameLabel.font = .boldSystemFont(ofSize: 17)
        nameLabel.frame = CGRect(x: 30, y: 230, width: 100, height: 30)
        view.addSubview(nameLabel)
        
        nameTextField.placeholder = "Введите имя"
        nameTextField.backgroundColor = .systemGray
        nameTextField.frame = CGRect(x: 30, y: 265, width: 350, height: 30)
        nameTextField.layer.cornerRadius = 2
        nameTextField.clipsToBounds = true
        view.addSubview(nameTextField)
        
        dateLabel.text = "Дата"
        dateLabel.textColor = .systemPurple
        dateLabel.font = .boldSystemFont(ofSize: 17)
        dateLabel.frame = CGRect(x: 30, y: 310, width: 100, height: 30)
        view.addSubview(dateLabel)
        
        dateTextField.placeholder = "Введите дату"
        dateTextField.backgroundColor = .systemGray
        dateTextField.frame = CGRect(x: 30, y: 345, width: 350, height: 30)
        dateTextField.layer.cornerRadius = 2
        dateTextField.clipsToBounds = true
        view.addSubview(dateTextField)
        
        placeLabel.text = "Бронируемое место"
        placeLabel.textColor = .systemPurple
        placeLabel.font = .boldSystemFont(ofSize: 17)
        placeLabel.frame = CGRect(x: 30, y: 390, width: 170, height: 30)
        view.addSubview(placeLabel)
        
        placeTextField.placeholder = "Выберите место"
        placeTextField.backgroundColor = .systemGray
        placeTextField.font = .boldSystemFont(ofSize: 17)
        placeTextField.frame = CGRect(x: 30, y: 425, width: 350, height: 30)
        placeTextField.layer.cornerRadius = 2
        placeTextField.clipsToBounds = true
        view.addSubview(placeTextField)
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
    
    func buttonCancel() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(backToSecondViewController))
        let tabBar = navigationItem.leftBarButtonItem
        tabBar?.tintColor = .systemPurple
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
            action: #selector(donePickerAction))
        toolBar.setItems([doneButtonPlace], animated: true)
        placeTextField.inputAccessoryView = toolBar
        placeTextField.inputView = pickerViewPlace
        
    }
    
    func createDatePicker () {
        /// toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        /// bar button
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: nil,
            action: #selector(donePressedAction))
        toolBar.setItems([doneButton], animated: true)
        /// assign toolbar
        dateTextField.inputAccessoryView = toolBar
        
        /// assign date picker to the text field
        dateTextField.inputView = datePicker
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        let localeID = Locale.preferredLanguages.first
        datePicker.locale = Locale(identifier: localeID ?? "nil")
    }
    // MARK: @Objc private func
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
    
    @objc private func backToSecondViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func donePickerAction() {
        view.endEditing(true)
    }
    
    @objc func donePressedAction() {
        /// formater date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
}
