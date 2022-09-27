//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// Начальний VC
class ViewController: UIViewController {

    var activity = UIActivityViewController(activityItems: ["VK"], applicationActivities: nil)
    let picker = UIPickerView()
    let someArray = ["Поделится", "Машины", "Мотоциклы"]
    @IBOutlet weak var buttonShare: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView()
    }
    
    @IBAction func buttonShareAction(_ sender: UIButton) {
        present(activity, animated: true, completion: nil)
    }
    func pickerView() {
        picker.dataSource = self
        picker.delegate = self
        picker.frame = CGRect(
            x: 0,
            y: 50,
            width: 450,
            height: 200)
        picker.center.x = view.center.x
        picker.tag = 0
        view.addSubview(picker)
    }
}
