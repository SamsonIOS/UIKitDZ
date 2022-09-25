//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by coder on 24.09.2022.
//

import Foundation
import UIKit
/// SecondViewController - второй экран с информацией
class SecondViewController: UIViewController {
    
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
    let labelJack = UILabel()
    let labelJackInfo = UILabel()
    let labelJackDays = UILabel()
    
    let labelJeremy = UILabel()
    let labelJeremyInfo = UILabel()
    let labelJeremyDays = UILabel()
    
    let labelGarfild = UILabel()
    let labelGarfildInfo = UILabel()
    let labelGarfildDays = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        labelJack.text = "Jack"
        labelJack.font = .boldSystemFont(ofSize: 20)
        labelJack.frame = CGRect(x: 95, y: 115, width: 50, height: 50)
        
        labelJackInfo.text = "25 марта, в четверг исполниться 24 года"
        labelJackInfo.font = .systemFont(ofSize: 15)
        labelJackInfo.textColor = .systemGray
        labelJackInfo.frame = CGRect(x: 95, y: 150, width: 300, height: 30)
        
        labelJackDays.text = "15 дней"
        labelJackDays.textColor = .systemGray
        labelJackDays.font = .systemFont(ofSize: 17)
        labelJackDays.frame = CGRect(x: 335, y: 125, width: 70, height: 30)
        
        labelJeremy.text = "Jeremy"
        labelJeremy.font = .boldSystemFont(ofSize: 20)
        labelJeremy.frame = CGRect(x: 95, y: 215, width: 70, height: 50)
        
        labelJeremyInfo.text = "21 февраля, в пятницу исполнится 22 года"
        labelJeremyInfo.font = .systemFont(ofSize: 15)
        labelJeremyInfo.textColor = .systemGray
        labelJeremyInfo.frame = CGRect(x: 95, y: 250, width: 310, height: 30)
        
        labelJeremyDays.text = "23 дня"
        labelJeremyDays.textColor = .systemGray
        labelJeremyDays.font = .systemFont(ofSize: 17)
        labelJeremyDays.frame = CGRect(x: 335, y: 225, width: 70, height: 30)
        
        labelGarfild.text = "Garfild"
        labelGarfild.font = .boldSystemFont(ofSize: 20)
        labelGarfild.frame = CGRect(x: 95, y: 315, width: 70, height: 50)
        
        labelGarfildInfo.text = "5 октября, в субботу исполнится 18 лет"
        labelGarfildInfo.font = .systemFont(ofSize: 15)
        labelGarfildInfo.textColor = .systemGray
        labelGarfildInfo.frame = CGRect(x: 95, y: 350, width: 300, height: 30)
        
        labelGarfildDays.text = "29 дней"
        labelGarfildDays.textColor = .systemGray
        labelGarfildDays.font = .systemFont(ofSize: 17)
        labelGarfildDays.frame = CGRect(x: 335, y: 325, width: 70, height: 30)
        
        view.addSubview(labelJack)
        view.addSubview(labelJackInfo)
        view.addSubview(labelJackDays)
        view.addSubview(labelJeremy)
        view.addSubview(labelJeremyInfo)
        view.addSubview(labelJeremyDays)
        view.addSubview(labelGarfild)
        view.addSubview(labelGarfildInfo)
        view.addSubview(labelGarfildDays)
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
        let threedVC = ThreedViewController()
        let navigationVC = UINavigationController(rootViewController: threedVC)
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC, animated: true)
    }
}
