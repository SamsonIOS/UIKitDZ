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
    let infoImageView: UIImageView = {
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
    let images = [
        UIImage(named: "logopc"),
        UIImage(named: "logoprice"),
        UIImage(named: "games")]
    let bookButton = UIButton()
    let contactButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSettings()
    }
    // MARK: Methods
    func configureSettings() {
        imageViewSetting()
        createSegment()
        configureBarButtonItem()
        configureSettingsButtons()
    }
    
    func configureSettingsButtons() {
        bookButton.setTitle("Забронировать", for: .normal)
        bookButton.frame = CGRect(x: 0, y: 580, width: 300, height: 50)
        bookButton.center.x = view.center.x
        bookButton.backgroundColor = .systemPurple
        bookButton.layer.cornerRadius = 15
        bookButton.clipsToBounds = true
        bookButton.addTarget(self,
                               action: #selector(showThreedViewAction),
                               for: .touchUpInside)
        view.addSubview(bookButton)
        
        contactButton.setTitle("Связаться с нами", for: .normal)
        contactButton.frame = CGRect(x: 0, y: 680, width: 300, height: 50)
        contactButton.center.x = view.center.x
        contactButton.backgroundColor = .systemPurple
        contactButton.layer.cornerRadius = 15
        contactButton.clipsToBounds = true
        contactButton.addTarget(self, action: #selector(actionContactButton), for: .touchUpInside)
        view.addSubview(contactButton)
        
    }
    
    func imageViewSetting() {
        view.backgroundColor = .white
        view.addSubview(infoImageView)
        imageView.frame = CGRect(x: 0, y: 150, width: 435, height: 350)
        imageView.center.x = view.center.x
        imageView.image = images[0]
        view.addSubview(imageView)
    }

    func configureBarButtonItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "❮ Назад",
            style: .plain,
            target: self,
            action: #selector(backButtonTapAction))
        let tabBar = navigationItem.leftBarButtonItem
        tabBar?.tintColor = .white
    }

    func createSegment() {
        segmentControl = UISegmentedControl(items: menu)
        segmentControl.frame = CGRect(x: 0, y: 100, width: 300, height: 35)
        segmentControl.center.x = view.center.x
        segmentControl.addTarget(self,
                                 action: #selector(selectedValueAction(target:)),
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
    
    @objc private func backButtonTapAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectedValueAction(target: UISegmentedControl) {
        if target == segmentControl {
            let segmentIndex = target.selectedSegmentIndex
            
            imageView.image = images[segmentIndex]
        }
    }
    
    @objc private func showThreedViewAction() {
        let threedView = ToBookViewController()
        let navigationThreedView = UINavigationController(rootViewController: threedView)
        navigationThreedView.modalPresentationStyle = .fullScreen
        present(navigationThreedView, animated: true)
    }
}
