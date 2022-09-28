//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// CarsViewController - экран с продажей машин
class CarsViewController: UIViewController {
    
    @IBOutlet weak var buttonShare: UIButton!
    
    let activityView = UIActivityViewController(
        activityItems: ["BMW  e60, 2006 года"],
        applicationActivities: nil)
    let picker = UIPickerView()
    let caseInPickerView = ["Поделится", "Машины", "Мотоциклы"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePickerView()
    }
    
    func configurePickerView() {
        picker.dataSource = self
        picker.delegate = self
        picker.frame = CGRect(
            x: 0,
            y: 250,
            width: 450,
            height: 200)
        picker.center.x = view.center.x
        picker.tag = 0
        view.addSubview(picker)
    }
    
    @IBAction func buttonShareAction(_ sender: UIButton) {
        present(activityView, animated: true, completion: nil)
    }
}
