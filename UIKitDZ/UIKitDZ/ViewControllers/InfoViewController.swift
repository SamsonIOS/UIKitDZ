//
//  InfoViewController.swift
//  UIKitDZ
//
//  Created by coder on 26.09.2022.
//

import UIKit
/// InfoViewController - экран с информацией о пользователе
class InfoViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewSetting()
        createSegment()
        buttonBack()
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
    @objc private func backButton() {
        dismiss(animated: true, completion: nil)
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
    @objc func selectedValue(target: UISegmentedControl) {
        if target == self.segmentControl {
            let segmentIndex = target.selectedSegmentIndex
            
            self.imageView.image = self.imageAll[segmentIndex]
        }
    }
}
