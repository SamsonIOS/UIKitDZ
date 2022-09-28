//
//  InfoViewController.swift
//  UIKitDZ
//
//  Created by coder on 26.09.2022.
//

import UIKit
/// InfoViewController - экран с информацией о клубе
class InfoViewController: UIViewController {
    // MARK: Constants
    let imageForInfoVC: UIImageView = {
        var mainPhoto = UIImageView(frame: CGRect(
            x: 0,
            y: 0,
            width: 1000,
            height: 1000))
        mainPhoto.image = UIImage(named: "fonvc2")
        return mainPhoto
    }()
    
    var segmentControl = UISegmentedControl()
    var imageView = UIImageView()
    var menu = ["Конфиги ПК", "Цены", "Игры"]
    let imageAll = [
        UIImage(named: "logopc"),
        UIImage(named: "logoprice"),
        UIImage(named: "games")]
    let buttonToBook = UIButton()
    let buttonContact = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSettings()
    }
    // MARK: Methods
    func configureSettings() {
        imageViewSetting()
        createSegment()
        buttonBack()
        settingsButtons()
    }
    
    func settingsButtons() {
        buttonToBook.setTitle("Забронировать", for: .normal)
        buttonToBook.frame = CGRect(x: 0, y: 580, width: 300, height: 50)
        buttonToBook.center.x = view.center.x
        buttonToBook.backgroundColor = .systemPurple
        buttonToBook.layer.cornerRadius = 15
        buttonToBook.clipsToBounds = true
        buttonToBook.addTarget(self,
                               action: #selector(buttonForThreedVC),
                               for: .touchUpInside)
        view.addSubview(buttonToBook)
        
        buttonContact.setTitle("Связаться с нами", for: .normal)
        buttonContact.frame = CGRect(x: 0, y: 680, width: 300, height: 50)
        buttonContact.center.x = view.center.x
        buttonContact.backgroundColor = .systemPurple
        buttonContact.layer.cornerRadius = 15
        buttonContact.clipsToBounds = true
        buttonContact.addTarget(self, action: #selector(actionContactButton), for: .touchUpInside)
        view.addSubview(buttonContact)
        
    }
    
    func imageViewSetting() {
        view.backgroundColor = .white
        view.addSubview(imageForInfoVC)
        imageView.frame = CGRect(x: 0, y: 150, width: 435, height: 350)
        imageView.center.x = view.center.x
        imageView.image = imageAll[0]
        view.addSubview(imageView)
    }

    func buttonBack() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "❮ Назад",
            style: .plain,
            target: self,
            action: #selector(backButton))
        let tabBar = navigationItem.leftBarButtonItem
        tabBar?.tintColor = .white
    }

    func createSegment() {
        segmentControl = UISegmentedControl(items: menu)
        segmentControl.frame = CGRect(x: 0, y: 100, width: 300, height: 35)
        segmentControl.center.x = view.center.x
        segmentControl.addTarget(self,
                                 action: #selector(selectedValue(target:)),
                                 for: .valueChanged)
        view.addSubview(segmentControl)
    }
    // MARK: @Objc private func
    @objc private func actionContactButton() {
        let alertController = UIAlertController(title: .none, message: "+799912345678", preferredStyle: .alert)
        let alertActionCall = UIAlertAction(title: "Позвонить", style: .default)
        let alecrtActionCancel = UIAlertAction(title: "Отмена", style: .default)
        alertController.addAction(alertActionCall)
        alertController.addAction(alecrtActionCancel)
        present(alertController, animated: true)
    }
    
    @objc private func backButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectedValue(target: UISegmentedControl) {
        if target == self.segmentControl {
            let segmentIndex = target.selectedSegmentIndex
            
            self.imageView.image = self.imageAll[segmentIndex]
        }
    }
    
    @objc private func buttonForThreedVC() {
        let threedView = ToBookViewController()
        let navigationThreedView = UINavigationController(rootViewController: threedView)
        navigationThreedView.modalPresentationStyle = .fullScreen
        present(navigationThreedView, animated: true)
    }
}
