//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by coder on 24.09.2022.
//

import Foundation
import UIKit
/// UserViewController - второй экран с добавлением нового человека
class UserViewController: UIViewController {
    
    let firstImage: UIImageView = {
        let imageFirst = UIImageView(frame: CGRect(
            x: 20,
            y: 120,
            width: 70,
            height: 70))
        imageFirst.image = UIImage(named: "default")
        imageFirst.layer.cornerRadius = 30
        imageFirst.clipsToBounds = true
        return imageFirst
    }()
    let secondImage: UIImageView = {
        let imageSecond = UIImageView(frame: CGRect(
            x: 20,
            y: 220,
            width: 70,
            height: 70))
        imageSecond.image = UIImage(named: "default")
        imageSecond.layer.cornerRadius = 30
        imageSecond.clipsToBounds = true
        return imageSecond
    }()
    let threedImage: UIImageView = {
        let imageThreed = UIImageView(frame: CGRect(
            x: 20,
            y: 320,
            width: 70,
            height: 70))
        imageThreed.image = UIImage(named: "default")
        imageThreed.layer.cornerRadius = 30
        imageThreed.clipsToBounds = true
        return imageThreed
    }()
    let jackLabel = UILabel()
    let jackInfoLabel = UILabel()
    let jackDaysLabel = UILabel()
    
    let jeremyLabel = UILabel()
    let jeremyInfoLabel = UILabel()
    let jeremyDaysLabel = UILabel()
    
    let garfildLabel = UILabel()
    let garfildInfoLabel = UILabel()
    let garfildDaysLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    func configureViews() {
        buttonBack()
        settingsView()
        addImageOnView()
        settingsLabelsForSecondController()
        buttonAdd()
    }
    func settingsView() {
        view.backgroundColor = .white
    }
    func addImageOnView() {
        view.addSubview(firstImage)
        view.addSubview(secondImage)
        view.addSubview(threedImage)
    }
    func settingsLabelsForSecondController() {
        jackLabel.text = "Jack"
        jackLabel.font = .boldSystemFont(ofSize: 20)
        jackLabel.frame = CGRect(x: 95, y: 115, width: 50, height: 50)
        
        jackInfoLabel.text = "25 марта, в четверг исполниться 24 года"
        jackInfoLabel.font = .systemFont(ofSize: 15)
        jackInfoLabel.textColor = .systemGray
        jackInfoLabel.frame = CGRect(x: 95, y: 150, width: 300, height: 30)
        
        jackDaysLabel.text = "15 дней"
        jackDaysLabel.textColor = .systemGray
        jackDaysLabel.font = .systemFont(ofSize: 17)
        jackDaysLabel.frame = CGRect(x: 335, y: 125, width: 70, height: 30)
        
        jeremyLabel.text = "Jeremy"
        jeremyLabel.font = .boldSystemFont(ofSize: 20)
        jeremyLabel.frame = CGRect(x: 95, y: 215, width: 70, height: 50)
        
        jeremyInfoLabel.text = "21 февраля, в пятницу исполнится 22 года"
        jeremyInfoLabel.font = .systemFont(ofSize: 15)
        jeremyInfoLabel.textColor = .systemGray
        jeremyInfoLabel.frame = CGRect(x: 95, y: 250, width: 310, height: 30)
        
        jeremyDaysLabel.text = "23 дня"
        jeremyDaysLabel.textColor = .systemGray
        jeremyDaysLabel.font = .systemFont(ofSize: 17)
        jeremyDaysLabel.frame = CGRect(x: 335, y: 225, width: 70, height: 30)
        
        garfildLabel.text = "Garfild"
        garfildLabel.font = .boldSystemFont(ofSize: 20)
        garfildLabel.frame = CGRect(x: 95, y: 315, width: 70, height: 50)
        
        garfildInfoLabel.text = "5 октября, в субботу исполнится 18 лет"
        garfildInfoLabel.font = .systemFont(ofSize: 15)
        garfildInfoLabel.textColor = .systemGray
        garfildInfoLabel.frame = CGRect(x: 95, y: 350, width: 300, height: 30)
        
        garfildDaysLabel.text = "29 дней"
        garfildDaysLabel.textColor = .systemGray
        garfildDaysLabel.font = .systemFont(ofSize: 17)
        garfildDaysLabel.frame = CGRect(x: 335, y: 325, width: 70, height: 30)
        
        view.addSubview(jackLabel)
        view.addSubview(jackInfoLabel)
        view.addSubview(jackDaysLabel)
        view.addSubview(jeremyLabel)
        view.addSubview(jeremyInfoLabel)
        view.addSubview(jeremyDaysLabel)
        view.addSubview(garfildLabel)
        view.addSubview(garfildInfoLabel)
        view.addSubview(garfildDaysLabel)
    }
    func buttonBack() {
        title = "Birhday"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "❮ Back",
            style: .plain,
            target: self,
            action: #selector(dismissSelf))
        let tabBar = navigationItem.leftBarButtonItem
        tabBar?.tintColor = .systemBlue
    }
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    func buttonAdd() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(pushNewView))
        let tabBar = navigationItem.rightBarButtonItem
        tabBar?.tintColor = .systemBlue
    }
    @objc func pushNewView() {
        let threedVC = AddUserViewController()
        let navigationVC = UINavigationController(rootViewController: threedVC)
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC, animated: true)
    }
}
