//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// CarsViewController - экран с продажей машин
class CarsViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var buttonShare: UIButton!
    // MARK: Public properties
    let activityView = UIActivityViewController(
        activityItems: ["BMW  e60, 2006 года"],
        applicationActivities: nil)
    let picker = UIPickerView()
    let caseInPickerView = ["Поделится", "Машины", "Мотоциклы"]
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePickerView()
    }
    // MARK: Public Methods
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
    // MARK: IBAction 
    @IBAction func buttonShareAction(_ sender: UIButton) {
        present(activityView, animated: true, completion: nil)
    }
}
